Received: from pku.edu.cn (mx19.pku.edu.cn [162.105.129.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4DF68
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 04:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pku.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=uKocQ6QX3U
	75iYaCrb38gSsJ+ORC3rxNIiX8AsEjJGk=; b=aVPwOkZAayhVXw/fTJyCnMXIJi
	FwIfx351pUG6Ek8MzOilLMCmXmp5/DjE9skAVayfRO2tkgljkDcyXT8ja6ZDqEA9
	RMZS6TU/p4z7DB3uXZAr+lTJ9fmeEgqgxNC31DTIYSdNq/06OkjZsAeYZs5GEFgc
	oTKtCh7xu+WGrt6hM=
Received: from junqi-virtual-machine (unknown [10.2.70.49])
	by front02 (Coremail) with SMTP id 54FpogCHgr1wFZ9hu9WkAw--.4637S2;
	Thu, 25 Nov 2021 12:47:45 +0800 (CST)
From: Liu Junqi <liujunqi@pku.edu.cn>
To: gregkh@linuxfoundation.org
Cc: david.kershner@unisys.com,
	sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev,
	Liu Junqi <liujunqi@pku.edu.cn>
Subject: [PATCH 1/3] staging: unisys: visornic: fixed a typo cant -> can't
Date: Thu, 25 Nov 2021 12:47:27 +0800
Message-Id: <20211125044729.594727-1-liujunqi@pku.edu.cn>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:54FpogCHgr1wFZ9hu9WkAw--.4637S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF45Xw1rXF15WF15Zw4kCrg_yoWDGrX_u3
	y7t39IvrW3Ar17Jw15tF1UA3srKF47Wwsa9w1qgw13KFW5Z34DArykuF13Ja43XrW2yFW3
	Zr4UXry8Kw12yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
	wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
	vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
	87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
	Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAI
	w28IcVCjz48v1sIEY20_Kr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UU
	UUU
X-CM-SenderInfo: arzqiiirtqlmo6sn3hxhgxhubq/1tbiAwEPD1Py7tbyVAAKs3

Fixed a typo: cant -> can't in visornic_main.c.

Signed-off-by: Liu Junqi <liujunqi@pku.edu.cn>
---
 drivers/staging/unisys/visornic/visornic_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/unisys/visornic/visornic_main.c b/drivers/staging/unisys/visornic/visornic_main.c
index 62cd9b783732..18be80648825 100644
--- a/drivers/staging/unisys/visornic/visornic_main.c
+++ b/drivers/staging/unisys/visornic/visornic_main.c
@@ -1590,7 +1590,7 @@ static void send_rcv_posts_if_needed(struct visornic_devdata *devdata)
 	netdev = devdata->netdev;
 	rcv_bufs_allocated = 0;
 	/* this code is trying to prevent getting stuck here forever,
-	 * but still retry it if you cant allocate them all this time.
+	 * but still retry it if you can't allocate them all this time.
 	 */
 	cur_num_rcv_bufs_to_alloc = devdata->num_rcv_bufs_could_not_alloc;
 	while (cur_num_rcv_bufs_to_alloc > 0) {
-- 
2.32.0

