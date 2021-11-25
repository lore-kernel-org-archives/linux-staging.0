Received: from pku.edu.cn (mx18.pku.edu.cn [162.105.129.181])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4677468
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 04:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pku.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=6JvXksT2hN6qWuYI8cIaqcqnCmxNuY++Ne
	ptYczBbq0=; b=EBVxT8lp+NuQ9qjqH30D1zoEKj7gwbs4+QD/qjCzDjV/GB0VZ1
	Sd1TNZwYxGFehVfDweK1ATjTpGWjv83Jaf9IPViLa+AniKG/0IGNg1NoLGa+3ySE
	V+xKk5YAoXqR15r/CuieHzuWjNs+7fQvcHWKW8um/RiHgM8BkgknQaKrA=
Received: from junqi-virtual-machine (unknown [10.2.70.49])
	by front02 (Coremail) with SMTP id 54FpogAHDq50FZ9h1dWkAw--.62962S2;
	Thu, 25 Nov 2021 12:47:48 +0800 (CST)
From: Liu Junqi <liujunqi@pku.edu.cn>
To: gregkh@linuxfoundation.org
Cc: david.kershner@unisys.com,
	sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev,
	Liu Junqi <liujunqi@pku.edu.cn>
Subject: [PATCH 3/3] staging: unisys: visornic: removed a blank line at the end of function
Date: Thu, 25 Nov 2021 12:47:29 +0800
Message-Id: <20211125044729.594727-3-liujunqi@pku.edu.cn>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211125044729.594727-1-liujunqi@pku.edu.cn>
References: <20211125044729.594727-1-liujunqi@pku.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:54FpogAHDq50FZ9h1dWkAw--.62962S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKrykuw48AF1fCFy7Zw17trb_yoW3Zwc_u3
	y7t3ySvryfAryxGw1UtF1UJ34xtFW7Wwsak3W2gw1fKa1UAwsxAry8Z3WaqFy5XF12kFW7
	ZFs5XryFyw15tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
	87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
	JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAI
	w28IcVCjz48v1sIEY20_Kr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI
	0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUouWlDUUUU
X-CM-SenderInfo: arzqiiirtqlmo6sn3hxhgxhubq/1tbiAwEPD1Py7tbyVAAOsz

Removed a blank line at the end of function to clear checkpatch warning
and make it more like typical coding style.

Signed-off-by: Liu Junqi <liujunqi@pku.edu.cn>
---
 drivers/staging/unisys/visornic/visornic_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/unisys/visornic/visornic_main.c b/drivers/staging/unisys/visornic/visornic_main.c
index aec0db28126d..643432458105 100644
--- a/drivers/staging/unisys/visornic/visornic_main.c
+++ b/drivers/staging/unisys/visornic/visornic_main.c
@@ -1764,7 +1764,6 @@ static void visornic_channel_interrupt(struct visor_device *dev)
 		napi_schedule(&devdata->napi);
 
 	atomic_set(&devdata->interrupt_rcvd, 0);
-
 }
 
 /* visornic_probe - probe function for visornic devices
-- 
2.32.0

