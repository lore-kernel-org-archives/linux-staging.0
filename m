Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53077B
	for <linux-staging@lists.linux.dev>; Tue, 18 Oct 2022 08:41:33 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [10.162.98.155])
	by mail-app4 (Coremail) with SMTP id cS_KCgC3294QZU5jXctcBw--.7796S2;
	Tue, 18 Oct 2022 16:34:32 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	paskripkin@gmail.com,
	gregkh@linuxfoundation.org,
	martin@kaiser.cx,
	straube.linux@gmail.com,
	kuba@kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH] drivers: staging: r8188eu: Fix sleep-in-atomic-context bug in rtw_join_timeout_handler
Date: Tue, 18 Oct 2022 16:34:24 +0800
Message-Id: <20221018083424.79741-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:cS_KCgC3294QZU5jXctcBw--.7796S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZrW5Gw1xurW8tr1kCryDWrg_yoWkKFXEgr
	Z2qF47Zr1kAFn7Jw15AanIvrySva1UWF40q3yvgFWaq3yUJayxXrn2grWDCF15Gay7AF9x
	AF1vgw1rAr1xAjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl6s0DM28EF7xvwVC2z280
	aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07
	x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI
	7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
	ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAgIHAVZdtb+JnwAUsF
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The rtw_join_timeout_handler() is a timer handler that
runs in atomic context, but it could call msleep().
As a result, the sleep-in-atomic-context bug will happen.
The process is shown below:

     (atomic context)
rtw_join_timeout_handler
 _rtw_join_timeout_handler
  rtw_do_join
   rtw_select_and_join_from_scanned_queue
    rtw_indicate_disconnect
     rtw_lps_ctrl_wk_cmd
      lps_ctrl_wk_hdl
       LPS_Leave
        LPS_RF_ON_check
         msleep //sleep in atomic context

Fix by removing msleep() and replacing with mdelay().

Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 870d81735b8..5290ac36f08 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -273,7 +273,7 @@ static s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 			err = -1;
 			break;
 		}
-		msleep(1);
+		mdelay(1);
 	}
 
 	return err;
-- 
2.17.1

