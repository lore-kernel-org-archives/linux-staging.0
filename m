Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D6A3321D7
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767609947; cv=none; b=aL/dzaQm0MlJOqY4OBDewJcbUGCSLiTRAla6ApluQ7nwEtklgX21Ocs9le0AghszP2Ixz49Ao0llS789NBaw1dr2WJetgyuXIQw2qn6tgXL37EbtCIoI5XtMDATMAY2/EFo22ybDfKvO9rcDWbTElh4MuGhMwfQ5vUglOWHy7VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767609947; c=relaxed/simple;
	bh=ouYw7GMmNX6stKEBjJi1qzQfom8iN1qVfReVqZXFUmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YPI0iYv/0O0WoKqC4ZXaScNg9pnPYuGVBl9MqKeltCHxKt70v+mR+w/1lyiDkSk0FFfiRoevQikz6ZMcA+sqgbnvtm11PwYQVKzWqYCzqAy5ewA/J+2C/HcEgXTbMRt12F1PlrYJRNCdKJ+20x5mMjpHO+cF/Fdze1CGndeSVqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=K2OnCHzh; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="K2OnCHzh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=8U
	j1pTPRPcsRgexAtK4ViFtpiTuVh8bu+0hDS2e4um4=; b=K2OnCHzhZjRNITWT0D
	nAg+UA0nijDEW4Hw3lbvRAe1I6ku0CqTFUN7EZDE/IY1ABZda16tGBJNI4EVut++
	qtG/OOC9HxlJkUBQ9P3melMAys+TW76qVkMau4S9XDhR+usSqwtxvCwIBSju5Dgd
	PtUQE4LpNo36Ppwr37xG9RfeU=
Received: from outlook.com (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBnpxI1lltpOgk_EA--.3518S3;
	Mon, 05 Jan 2026 18:45:20 +0800 (CST)
From: Holden Hsu <holden_hsu@163.com>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Holden Hsu <holden_hsu@163.com>
Subject: [PATCH 1/2] staging: greybus: arche-platform: clarify TODO comment
Date: Mon,  5 Jan 2026 02:45:04 -0800
Message-ID: <20260105104505.8120-2-holden_hsu@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105104505.8120-1-holden_hsu@163.com>
References: <20260105104505.8120-1-holden_hsu@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnpxI1lltpOgk_EA--.3518S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWxGrW3CFyDuFWfZryrJFb_yoWftFg_Xw
	s2kw4xtr1rA3s29w12yF43CrySvws7Ww4vv3y8tr9Iy34Fk39rJFyDuryUXFnrW3y7KFy3
	AanrKr1ayr13ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU11xRJUUUUU==
X-CM-SenderInfo: xkrovv5qbk23i6rwjhhfrp/xtbC3wHmuGlblkFLKgAA3E

The TODO comment 'sequence ??' is unclear and provides little context
about what needs to be implemented. Replace it with 'TODO: define shutdown
sequence' to better describe the required implementation.

Signed-off-by: Holden Hsu <holden_hsu@163.com>
---
 drivers/staging/greybus/arche-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index 8aaff4e45..de38cd4b3 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -572,7 +572,7 @@ static __maybe_unused int arche_platform_suspend(struct device *dev)
 	 * If timing profile premits, we may shutdown bridge
 	 * completely
 	 *
-	 * TODO: sequence ??
+	 * TODO: define shutdown sequence
 	 *
 	 * Also, need to make sure we meet precondition for unipro suspend
 	 * Precondition: Definition ???
-- 
2.43.0

