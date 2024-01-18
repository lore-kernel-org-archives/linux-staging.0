Received: from zg8tmty3ljk5ljewns4xndka.icoremail.net (zg8tmty3ljk5ljewns4xndka.icoremail.net [167.99.105.149])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06D82575D
	for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 15:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.99.105.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705590827; cv=none; b=ocLoxU+RBg1dpd34W6EmxDNv/SrBtRR0Q1ZD+D16eIhxJumhmoRiH8vU7Dvh2Ua9RWOdqt8YIvdL5Qjl3n/ecE9uEDWrIPCN08MWsC4jz/4b6r7+TCku+qmLhKG0OxucW3xmSLnStGMUzUL7D+k41X95p2eFqENf+RhLl6tEOZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705590827; c=relaxed/simple;
	bh=Kp2BlCBZMsuGi/OMB6tp4CaDWFkRha05w33XL2xn/Ws=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo; b=ldJZ188mIC8xdMgB/zxO+KcIQht7fY14GVsmMqJh/a5n4+cL93UJJmjNd5+vZrO5TFZLg3GU5Tiavm6cukJQcl4MFSQ68AbgvGCt8P+O/0DWMhg7kRrEZYuNrWoJe7mBuaL/LVr2U2f60z1WWbB8leNjOx1FGIFxTZquczVUU/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=167.99.105.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from luzhipeng.223.5.5.5 (unknown [183.159.169.110])
	by mail-app4 (Coremail) with SMTP id cS_KCgDHwX8gQKllMBo+AA--.10025S2;
	Thu, 18 Jan 2024 23:13:37 +0800 (CST)
From: Zhipeng Lu <alexious@zju.edu.cn>
To: alexious@zju.edu.cn
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kate Hsuan <hpa@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Brent Pappas <bpappas@pappasbrent.com>,
	Alan Cox <alan@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] media: atomisp: ssh_css: Fix a null-pointer dereference in load_video_binaries
Date: Thu, 18 Jan 2024 23:13:00 +0800
Message-Id: <20240118151303.3828292-1-alexious@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cS_KCgDHwX8gQKllMBo+AA--.10025S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw15uw1xGrW5KF1xuF1rWFg_yoW8Xr17pF
	48Aw1DCFWUXFn2kanIkry7GF90v34v9ay5W34vqa4F9a92ya4qqF15Kay5Gr9Yvr4DJ3yq
	vFyYgrWUXF4FyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: qrsrjiarszq6lmxovvfxof0/

The allocation failure of mycs->yuv_scaler_binary in load_video_binaries
is followed with a dereference of mycs->yuv_scaler_binary after the
following call chain:

sh_css_pipe_load_binaries
  |-> load_video_binaries (mycs->yuv_scaler_binary == NULL)
  |
  |-> sh_css_pipe_unload_binaries
        |-> unload_video_binaries

In unload_video_binaries, it calls to ia_css_binary_unload with argument
&pipe->pipe_settings.video.yuv_scaler_binary[i], which refers to the
same memory slot as mycs->yuv_scaler_binary. Thus, a null-pointer
dereference is triggered.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>
---
Changelog:

v2: change fix approach to set mycs->num_yuv_scaler = 0 in
load_video_binaries. Change the fix tag to correct commit.
---
 drivers/staging/media/atomisp/pci/sh_css.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index f35c90809414..638f08b3f21b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -4719,6 +4719,7 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 						  sizeof(struct ia_css_binary),
 						  GFP_KERNEL);
 		if (!mycs->yuv_scaler_binary) {
+			mycs->num_yuv_scaler = 0;
 			err = -ENOMEM;
 			return err;
 		}
-- 
2.34.1

