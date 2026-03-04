Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA86C3CD8AA
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 19:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772651967; cv=none; b=f5LQmV/+At1KGUgXMHQsAAtBisQotqXNaSoYqGmLuV7u+kVFIO3zCfAL9qFbABMvpyw8x1+1cl2GaHK9yFqpUbd4pBtMLETnptdaByX+lv+kprfo2/1p2sTOlFiIwuu41ZvCLsEa9I/BPndcy36a1NrsyZkSRrKkdkw3qxbDaFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772651967; c=relaxed/simple;
	bh=KtMloLAjaYn+gwP362zAnW9O3LbVLb9ezwt4mXRDDfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fe7FnFrQHOlGRCE8MgWlKyafhfF9Var9+d14aFyi+Kw/HxcgoRVhzCanNv1LCNLdoJjdQA7RJ9do/ifEuA0m6o2hVpYFyaPbmX6L59fpJRK0snLlBL1owBHLNQdWxyH7weZhog07UQU7D/E5YqTzDMVlHEC2TtZreZgGf6u/RPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7TiLSRc; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7TiLSRc"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a2e62b893so15460181fa.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 11:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772651963; x=1773256763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G8xRFn2w9z/jS1C6VB4kiHAZ9cEGHmvzdhzaEpkLpaw=;
        b=f7TiLSRc4wUhB0FAcrshcg21MSciCQVANmHhxIfvaLGltcZJfmRiNl9svuT+ZyaAyv
         rJQEQpW7iGA6YQvTMkaUOHVCeJ4R++q0O0U7qDrK5aJ9jA/zK47G0FUeYuIK6vFVp8SJ
         WWK3Fbz8AnUpFZj07beoPEOwWUyy3rQmD1HVtig8dqsWAE6/PT3v1dnM3m+3Qn0kPtu1
         85YSgBmdaNkoKSCsPy5Xsv8REPMJuI11xTprgYjc4I24nNWZtdCpR+UzctOQ7+InvX0F
         TbA+U4/k1m//C9USQxILNg0qs8efAbEzRwFLZp/bpsp/IF2Jtom0TPuWhfnhcsGVddag
         GN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772651963; x=1773256763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8xRFn2w9z/jS1C6VB4kiHAZ9cEGHmvzdhzaEpkLpaw=;
        b=vsZ0BgBUaJ3fBkqIgOa6x7qJchPkAzJjWrK1fDROU8tzNuqKuuViQ7Hvvsjk7BsYwN
         riyzCTatPd9+u1YbvIfWjbz65qVQNzJD6Sor6JSCnzrv9Njz543gA1E+2frnciVWXQLk
         XMELNzIIOl5QqsKP+LkCc4Ae5Ri3f03fxG+phiXgRBuKkT2njUbJ9I+tt3C3Y91huwG8
         hAqjMI4EoCWPehkcI55mXwFOiiKZpqBJsatgkc4yIeH2X6eCLUfqa8LyZ8pA+0uORbom
         GlMRlvaEXDXjlDqtuNAE7QBkD5en35tPJ9ITaGIkQuj0dyPXJ4zL3FWQhOEVo8RCAEo1
         gjGQ==
X-Gm-Message-State: AOJu0Yz1MPnKzoJlHTSRRLmXXoPR2NOH5AIty62DS3Dl96/7nLwk6zsy
	oN2rYNlnMStqWAALVGe9phNxKQM2PEOc830bclhwhHfdnwoaWArKBQfC
X-Gm-Gg: ATEYQzwbc1ji5BJBt+M/pfcIQ70Zpq6HwpKGU5DGn95MwYhR2QJ+D6mT0E3PRMJhLxR
	xpAsV4AJppACkGSosiorBBUaCeIYIPFYxQiBkf4iwI7o+puEP5ey4aYGxJet8SVEmYKxuIjF6YM
	Z8uszebcNk4HByXKeghE20YcNpjLx5IOjjg0SupI8rMRch2PoRKlXHTk1a4lYVOC0oiZRDQ36+5
	hhHQAwvszSY3e2u1iuGiLgkhSVZuA/j9CITCFN1n8u1Rjp/5au1PRJpZy/SDbUNjN4DkhgITzXZ
	IX5/aUutse1/sliziule1udTEgIlXlPs4bTcLsEO95YQNdXBuBeiFsTtHuTmckCp27/LSrXn79n
	SckWhTK5ShCva2XpFQRt4acaViEC4PtsNgDcdDerzwqmgNzYElawULf5Nc6qM/PRV5w9i3r2YPK
	GZAL9kcvmlehpQL8BmCXWxlNESgTIYP0vzmUS3sALFEbFWaRZPTl5ejK9qTc8BvAoLrKUNb64BT
	Z3a5AuEVwSL
X-Received: by 2002:a2e:bd07:0:b0:380:989:f615 with SMTP id 38308e7fff4ca-38a2c58c12dmr24430771fa.6.1772651962614;
        Wed, 04 Mar 2026 11:19:22 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12f4a5b03sm217166e87.87.2026.03.04.11.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:19:21 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment style in nvec.c
Date: Wed,  4 Mar 2026 20:18:53 +0100
Message-ID: <20260304191853.4500-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comment formatting to use * on subsequent lines
and */ on a separate line as required by kernel coding style.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/nvec/nvec.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..ee2715df3b48 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -646,7 +646,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec->state = 2;
 		}
 		break;
-	case 2:		/* first byte after command */
+	case 2:		/* First byte after command */
 		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
 			if (nvec->rx->data[0] != 0x01) {
 				dev_err(nvec->dev,
@@ -659,8 +659,9 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/* Delay ACK due to AP20 HW Bug
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.43.0

