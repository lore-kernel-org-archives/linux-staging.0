Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn [202.108.3.24])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 8ADD72CA1
	for <linux-staging@lists.linux.dev>; Tue,  1 Feb 2022 11:33:53 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.249.61.131])
	by sina.com (172.16.97.23) with ESMTP
	id 61F91A6C00022F6A; Tue, 1 Feb 2022 19:33:02 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 27523754919627
From: Hillf Danton <hdanton@sina.com>
To: Jia-Ju Bai <baijiaju1990@gmail.com>
Cc: jerome.pouiller@silabs.com,
	Greg KH <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] staging: wfx: possible deadlock in wfx_conf_tx() and wfx_add_interface()
Date: Tue,  1 Feb 2022 19:33:03 +0800
Message-Id: <20220201113303.3883-1-hdanton@sina.com>
In-Reply-To: <6f489bf2-bac0-8030-7ea5-6f5c12daa568@gmail.com>
References: <6f489bf2-bac0-8030-7ea5-6f5c12daa568@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 1 Feb 2022 15:09:34 +0800 Jia-Ju Bai wrote:
> Hello,
> 
> My static analysis tool reports a possible deadlock in the wfx driver in 
> Linux 5.16:
> 
> wfx_conf_tx()
>    mutex_lock(&wdev->conf_mutex); --> Line 225 (Lock A)
>    wfx_update_pm()
>      wait_for_completion_timeout(&wvif->set_pm_mode_complete, ...); --> 
> Line 3019 (Wait X)
> 
> wfx_add_interface()
>    mutex_lock(&wdev->conf_mutex); --> Line 737 (Lock A)
>    complete(&wvif->set_pm_mode_complete); --> Line 758 (Wake X)
> 
> When wfx_conf_tx() is executed, "Wait X" is performed by holding "Lock 
> A". If wfx_add_interface() is executed at this time, "Wake X" cannot be 
> performed to wake up "Wait X" in wfx_conf_tx(), because "Lock A" has 
> been already hold by wfx_conf_tx(), causing a possible deadlock.
> I find that "Wait X" is performed with a timeout, to relieve the 
> possible deadlock; but I think this timeout can cause inefficient execution.
> 
> I am not quite sure whether this possible problem is real and how to fix 
> it if it is real.
> Any feedback would be appreciated, thanks :)
> 
> 
> Best wishes,
> Jia-Ju Bai

Hey Jia-Ju

Thank you for reporting it.

Given the init_completion() prior to complete() in wfx_add_interface(),
no waiter is waken up by the complete(), so it has nothing to do with
the waiter in the conf path.

BTW if the unusual wfx init is a real use case then we can add a new helper.

Mind introducing your toy to LKML? How much time have you been put in it?
Its current status and future works?

Hillf

+++ x/include/linux/completion.h
@@ -74,6 +74,12 @@ static inline void complete_release(stru
 # define DECLARE_COMPLETION_ONSTACK_MAP(work, map) DECLARE_COMPLETION(work)
 #endif
 
+static inline void __init_completion(struct completion *x, unsigned int done)
+{
+	x->done = done;
+	init_swait_queue_head(&x->wait);
+}
+
 /**
  * init_completion - Initialize a dynamically allocated completion
  * @x:  pointer to completion structure that is to be initialized
@@ -83,8 +89,12 @@ static inline void complete_release(stru
  */
 static inline void init_completion(struct completion *x)
 {
-	x->done = 0;
-	init_swait_queue_head(&x->wait);
+	__init_completion(x, 0);
+}
+
+static inline void init_completion_done(struct completion *x)
+{
+	__init_completion(x, 1);
 }
 
 /**
