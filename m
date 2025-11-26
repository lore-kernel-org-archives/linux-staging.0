Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943101F956
	for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 01:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764121039; cv=none; b=RWqCxhmcwkQlPlc0tIT3liDKuvnemKIdsNI+C6CZ8TjE25nAdMPuna4FlKGm3cfZKqJ2Y8lPce1/smrvL+J8//4kTLKYU+OigVn/plxNFepwRQPe+s2nyllL8hdMam6tGuffY7HmzKV6xYuEQvNwIoALVMcTgMs670EEu2ptDro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764121039; c=relaxed/simple;
	bh=cjvrCLgiWTJQ2DuepgAkYIMwb1wUd8sUBxmcd3hMEkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rARl8+5GFjE1LQ84zIlY3ZNOvVN2iKm2LjlU4duQp/YgpC3vix7qqKx64UMJxTeVFsQe4zENQmhb0gkxDiHIToQQsH5pA3lIvfeQqqG604D3BPw8suanETIeUtsdjGiWr2xwh1vHU9fFxCGH+8QlZQjwrycJ6x8UsvFoC5n6ggs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowADn4mPGWSZpDwgWAg--.36141S2;
	Wed, 26 Nov 2025 09:37:11 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: matchstick@neverthere.org,
	niharchaithanya@gmail.com,
	paul.retourne@orange.fr,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] staging: gpib: ines: Check the return value of ioremap()
Date: Wed, 26 Nov 2025 09:36:18 +0800
Message-ID: <20251126013618.1052-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADn4mPGWSZpDwgWAg--.36141S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF15Jw1UKFy7CF1DXw15twb_yoWkXrb_Cr
	WvqrWxX34FyFyfCw17XFs7CrWavF1Du34rX3y0q3y5ArZxuF4DAryqvrn8Zw47Wa92yFyD
	Cr4xtr43u3W7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYCJmUU
	UUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwwSA2kmSKVFFgAAsr

The function ioremap() in ines_gpib_config() can fail and return NULL,
which is dereferenced without checking, leading to a NULL pointer
dereference.

Add a check for the return value of ioremap() and return -ENOMEM on
failure.

Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/staging/gpib/ines/ines_gpib.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index c851fd014f48..362a6310cab1 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1144,6 +1144,11 @@ static int ines_gpib_config(struct pcmcia_device *link)
 		return -ENODEV;
 	}
 	virt = ioremap(link->resource[2]->start, resource_size(link->resource[2]));
+	if (!virt) {
+		dev_warn(&link->dev, "ioremap failed\n");
+		ines_gpib_release(link);
+		return -ENOMEM;
+	}
 	writeb((link->resource[2]->start >> 2) & 0xff, virt + 0xf0); // IOWindow base
 	iounmap(virt);
 
-- 
2.50.1.windows.1

