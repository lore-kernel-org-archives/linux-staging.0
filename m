Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E475E281530
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629628; cv=none; b=nLUFzsH/N3xiG762V/PQb7VqU1Y+sQWQOsxhiNHlS4uY+FjGI5tyRny31aRqueEERMkjuNzoNT7W0H63WsFS3Hs0Qws0DM7bBHzM4zphokXoobJOBvZ8iqTI6d5Mx0qv0Qn0JMczNQnHnLLsQIgWf3mL5OUfZ1CfZCJQJcvhKtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629628; c=relaxed/simple;
	bh=bYkO9U+EL70YDlYdv6pIN/HU7GaGpGH0iyCHgs50/ZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UvyghwM8QVhw7Mc/GCLB2VZzJGMbpVWqgjLVZWLodvMYxpxZikFXf++EZu9A6/3ust/xx6FoZivZeFGhLv4Rxd24UT1KlHajIlUffU60XWqY54RcoIkT6UIKeqtXdnhWkHgJ4nkirlxFNl0ZO5n0isvlFh7SKgY14iow+Nd63e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PN5I92IO; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PN5I92IO"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-660ea6ceb5aso890623a12.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 05:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772629624; x=1773234424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jyx8Xzv1t2SnP4YfSFaS/MZkEnXhxOyrUrq/E4v4jPY=;
        b=PN5I92IOtnAszKhyBLSya5rLpCOQLa5dsblnBsVxvh/KJXc3nBUe+VniYNvm2pIorn
         zZe8VrM/5M3/W6bPTBZE7b+XgivZCkFRCakqiCAYkmKbK0Y0sfIUrPlLXM3auIVbf0vf
         MfRXvgbzvTVougWOnplz2Msp98QCsIc+2GVDHNdxGBKRioM7OeWnbufDf8dDGkyHhYYx
         lwLAhP1RCrRDoqMxdSHIWQnHOv5yEBU72QjpoX4xFOmrz5NhYaJHms0bhGZmIq7StvQ+
         zRcWee+niHYQu91BqpAkBxbySjeZQvlSr8BUINhzpbD+JFxU+c3aK3A7Np1MLv0VQ2LD
         Ihjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629624; x=1773234424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyx8Xzv1t2SnP4YfSFaS/MZkEnXhxOyrUrq/E4v4jPY=;
        b=fn9FmmhVmc4U/5yZfzxg7b0vxXa6LMtIFhdCCy4qr9s5kLNx6k7W1bbJPQZb6n4mrV
         ss4hPwux1XVBL9mlMUCIGZwDLHJekOQYR+PfSYZN42qtFuwTyiaon8WT+JDATa/q7O74
         B3cj61QeAkhd2hN7FjJCLzUximGNkGWE7JgppVLr1XT77X/c6mxW919HHQxxIzdsRMoe
         qPAU6MhdcmPYzL1ZDJ7XrCkvRMF1bCJYkpUy4KCxGEmcQumy5pNrn/FONJAL0fSkKoAP
         786e0KuZj2yc60bgrcSi/QAwKaX6G5RFiKIuPQrPRQ5SrAgoQmXOUVEHKo+bkKvk07Ic
         jXxw==
X-Forwarded-Encrypted: i=1; AJvYcCV0VO8ZxcebG5aNpu+wmZ5kXfSiJClDSttg73hbdbG/y1HfI/kqqhTyw3a9s4aeNi74pT6k8wPa9kqzetrJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzaAavnG+EQE/BptIVRjCwGGzQCSGdOq3Y7foxaq1e/lpIFcDfM
	19dDhwEFhgVIz2bXYeU5VCcbVY9B/xaYqoc4aoBpfyiSiqHuOxKk8uXD
X-Gm-Gg: ATEYQzxOqliLD9k36eN0i7UJuZ6hbvIW8Gwqjn398psjiOhZVfbWkw6TkmiuXk2TTJv
	1uDL+eJych6c6arWferYCywr+260e+Js7BoZRvQ4y9hCWLecFBmq8tJHKDkGRQlAd7hduYnUs6P
	Gpklf4UZPJedhh6gW1tC4YXo3taamLOWJiFAFP4KZZ48w43NqHTUquAbcrXKSHfPlMDHo516BNE
	ktYevCS6Bng6rQSD+aHnW6at5VPKgJrq6XBr7y+vMBz5QOUenLb872i4Tn23v2+FsaCfe1T6Tmh
	51u+BD55RY6T2WqCm4VHdlxfmqdSdH097tlxkpFa6T62x3yHWPxWWs1sEtbntWviEaKIunwI8PL
	aNz9DleE0FhIqUmFiL+SENzRdCLXs+v2C3PXk2sYyOUNr2r+i0eiP6KPK8vn/oQL/mt+bOFs0P1
	RkbzjcuqxHvll56Au3kK/9z3aYOfDbeiqFjatd98YRCeeHQNQh12u0sAHtfPUo3PRgTUwX0RbOl
	0pLavWaQlZSpo5slsd8YDZFGBAbXZMVPSrIaiSgM+lsVd3sFUa2dL9f8crBrSxhuQJNbDlRktlP
	mNy8urumePMOJXOk
X-Received: by 2002:a17:906:6a15:b0:b8e:380:5669 with SMTP id a640c23a62f3a-b93d449be64mr330933666b.32.1772629623958;
        Wed, 04 Mar 2026 05:07:03 -0800 (PST)
Received: from DESKTOP-JNMGKT5.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab13593sm738598366b.3.2026.03.04.05.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:02 -0800 (PST)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: marvin24@gmx.de
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment style in nvec.c
Date: Wed,  4 Mar 2026 14:07:01 +0100
Message-ID: <20260304130701.37332-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/nvec/nvec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08..0e655f79e 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -660,7 +660,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
 			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.43.0

