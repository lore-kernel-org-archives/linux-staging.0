Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8662B359A8C;
	Tue, 24 Mar 2026 08:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339751; cv=none; b=WiV/ZaTZGefFjXOn9qft64s4pFOp7UUgTyyGYcVbO690UYXeZnc7HejxVanT9yawTfu6kgeglzMeRnCPfQvDB4RZn9FT46g6paPrJ1tJ2W0L6aGF6R1oPV1UTuQdeIYBUTjvBxc6J7+HNwj/54SOsDfNtu7i5ujJ1pL7f01vPcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339751; c=relaxed/simple;
	bh=cqH5rURx3Dp+FJG2C8XwFT90pQsy89+ITQTIFqIQwEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E+uEaFsleGDbPbI3f2BZvvdQpRtwhJnLZID1ekiySR0TbK0YRfbNe79HPmVVJiuucr+qmA0kvGwGO5rKCfr2CgwBT2scD71gQRP9xAtHkBtyVDh4rZ+IuYIkNDhiinXQ7IUdq7MeKmuoxAzFwRUQkOibNE2AJ41nmqX7GPGQXo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowADnj2uYRsJpr877Cg--.1755S2;
	Tue, 24 Mar 2026 16:08:56 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: mripard@kernel.org
Cc: paulk@sys-base.io,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	nicolas.dufresne@collabora.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH] media: cedrus: skip invalid H.264 reference list entries
Date: Tue, 24 Mar 2026 16:08:56 +0800
Message-ID: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADnj2uYRsJpr877Cg--.1755S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFWrZF43AFyUGw4xtFWxtFb_yoW8Gry5pF
	4jgw12ya1DJF45GF47AF40vFyYgas5ZrWfCry5K3WxZF15uF1xuFnY9348Xrs8Za98C3ya
	yF1ag345Xa1DA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUOlkVUUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
stateless slice control and later uses their indices to look up
decode->dpb[] in _cedrus_write_ref_list().

Rejecting such controls in cedrus_try_ctrl() would break existing
userspace, since stateless H.264 reference lists may legitimately carry
out-of-range indices for missing references. Instead, guard the actual
DPB lookup in Cedrus and skip entries whose indices do not fit the fixed
V4L2_H264_NUM_DPB_ENTRIES array.

This keeps the fix local to the driver use site and avoids out-of-bounds
reads from malformed or unsupported reference list entries.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -210,6 +210,9 @@ static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
 		u8 dpb_idx;
 
 		dpb_idx = ref_list[i].index;
+		if (dpb_idx >= V4L2_H264_NUM_DPB_ENTRIES)
+			continue;
+
 		dpb = &decode->dpb[dpb_idx];
 
 		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
-- 
2.50.1

