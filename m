Received: from pku.edu.cn (mx19.pku.edu.cn [162.105.129.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F4A2C93
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 04:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pku.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=ZnvnhgVS4nBZOGwiYXRGtvCjFvrpHmiuqW
	UOCq866qY=; b=jDxJbDNbwcAF9nbqmrn6Q1ZQI3XxywZkW46ck0L/6J+hVvEmKL
	Dd+QqNt7CK3SQyOCk6gMHT7Pcm2m8PtxHzLshszF9mr+dvEPmiYHZ53o1V2sYL2e
	hVRdlEh0U/2BOxtaec8IG7PA1JNw2yYm5AZ/X3RtJb2dkzXc9DZ0RGztk=
Received: from junqi-virtual-machine (unknown [10.2.70.49])
	by front02 (Coremail) with SMTP id 54FpogDHzKxyFZ9hy9WkAw--.63694S2;
	Thu, 25 Nov 2021 12:47:46 +0800 (CST)
From: Liu Junqi <liujunqi@pku.edu.cn>
To: gregkh@linuxfoundation.org
Cc: david.kershner@unisys.com,
	sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev,
	Liu Junqi <liujunqi@pku.edu.cn>
Subject: [PATCH 2/3] staging: unisys: visornic: reindent to avoid '(' at the end of line
Date: Thu, 25 Nov 2021 12:47:28 +0800
Message-Id: <20211125044729.594727-2-liujunqi@pku.edu.cn>
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
X-CM-TRANSID:54FpogDHzKxyFZ9hy9WkAw--.63694S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKrykuw48AF1fCFy7Zw17trb_yoWfZFX_W3
	y2q3yavryfZryxCr1jyF1UJ3yxKFsFgwsa9wnFgF4IkFW5A3sxAry8ZFnxXFyUWF12krZx
	AFykXryrKw1YyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
	87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_
	JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAI
	w28IcVCjz48v1sIEY20_Kr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUF9a9DU
	UUU
X-CM-SenderInfo: arzqiiirtqlmo6sn3hxhgxhubq/1tbiAwEPD1Py7tbyVAAMsx

A change to make the code more like typical coding style.

Signed-off-by: Liu Junqi <liujunqi@pku.edu.cn>
---
 drivers/staging/unisys/visornic/visornic_main.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/unisys/visornic/visornic_main.c b/drivers/staging/unisys/visornic/visornic_main.c
index 18be80648825..aec0db28126d 100644
--- a/drivers/staging/unisys/visornic/visornic_main.c
+++ b/drivers/staging/unisys/visornic/visornic_main.c
@@ -1759,9 +1759,8 @@ static void visornic_channel_interrupt(struct visor_device *dev)
 	if (!devdata)
 		return;
 
-	if (!visorchannel_signalempty(
-				   devdata->dev->visorchannel,
-				   IOCHAN_FROM_IOPART))
+	if (!visorchannel_signalempty(devdata->dev->visorchannel,
+				      IOCHAN_FROM_IOPART))
 		napi_schedule(&devdata->napi);
 
 	atomic_set(&devdata->interrupt_rcvd, 0);
-- 
2.32.0

