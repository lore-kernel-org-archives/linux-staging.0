Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC2F1E9B31;
	Thu, 10 Apr 2025 05:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744261610; cv=none; b=c2d2AjgI9lIqqlF97Zq2MD4UCrIpkcLbP5emvJJFxMRc2peYV6inOM5ntkH9/RZlVKrEXghxe8m5796FUk33rkvGt1zP67JmeiJbPyLLqlc3PCJ/rphs7FnLUA0PuJKwebFMBj3AU7V6i5C9R+15XbGm1v10FbaV48PG7pE8lLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744261610; c=relaxed/simple;
	bh=8rCqixOvDHQ5m3uWKiliryBjCwbDUjuhy/lmzWlucQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PlI65k/yp/7Lt6usaCXWvg/uF/QlcS2TLRyAI9eaeHxl0r1WX3jalZyON/IQk+dfPdflYtxMCVQxnydV7qCRQFcwa3km/ujg1Wdd366RAVN4ELN3fhUCykGgnodp+nUZdy4CpwGkeP5YfCi1s1Krzr/Gv2gqUZgiO99M2w0qtVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K99DKQA6; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K99DKQA6"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-736c3e7b390so302467b3a.2;
        Wed, 09 Apr 2025 22:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744261609; x=1744866409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d46airT75vHv8EXQAD6iB9DXsZw0o96cfAedDj25Jsg=;
        b=K99DKQA6MCMzPnqJK7EIEV4RN99ilFqmj7TQY1UkHe6TtndNOxw/5Wer/UhTvmrJJz
         4/g/FNhVOB+2g1s0F/8wKT0B43cZl+GCVNtPv5PDxKJqCtRGshPOAAypCR5A5XBuE9Ae
         49JpgCf4iWmikK0OgBkG59R9O1Ly45nuuE85RfkowmK0PFAYC18VVP3nyr9Ofc96FgQ5
         h6c5gW3rmfm3ocKJH0K5h8cEdrBZoZGCfdwMXe6vDvFuxETRPtZXijW3C+Evr2bCkz/t
         rChC4EERmelom2KQDNxSkAlTS0BVsQu1eqos6+3uCA0AU+nSUEif4I7fq/wDQ+Jnn5gr
         0EMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744261609; x=1744866409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d46airT75vHv8EXQAD6iB9DXsZw0o96cfAedDj25Jsg=;
        b=sJnT6DQ/5Rlx0xmahDuXLLNaWdSsj7dEivKpb6mKhvnkuSfgq5iIwkofe7KfjdeVsJ
         73sDI1MMgM0c/SrDm6rmlgPkp7dqW7FpUF2NGt/560h6NKyZFViBrbUUtMR0iUjgNwtI
         LosnetBC0kmxTQInH3x6o0xThKzgotKTdPIWJAtMxfCPSNRYuKpbvGjVeTTZMyiXzUgS
         LQBflqXhE4eXF09cC5K6tI09ukpDUX1wtE33+lNbFgK2iWaIMiZaI/G12sxLCsX3x1Ja
         CpxtSIBvfaUI/Qu9+ZSI9ZbUo737Dy6zaMy9MaWXjNw476K173RLq09ZvQ5ArH3+0lIk
         kLbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD++diKxPZRjwTOtovVZ2eQg0syDlv+RCSThRKJVvYW51gFUOrkVcTh5xuuuMZVsJ/ask=@lists.linux.dev, AJvYcCUJs5DrfFdVZgw99sw7zpI14zH6IM+4odXCkJO/H2+DIyqd2SPaIgobqP+AuGjG59LEoLLvhlzchEKEPK0Sbw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEjxgHhLK3v3r+Qo0Nq1y3x3pCOqYKVWmdLcju3fKsOgGugfTP
	wyPv9QdAicLuC2zvndVT9gkl1TYFx2Nz1HJqPuziALZsokWEVI+h
X-Gm-Gg: ASbGncsZUSHwtFdhRBy12CNgpkiQ+NAxSI80oy56tGklT9b7GwnbRMoY3d0jCvDMDpy
	hS/3zmISu0U8XdASyXqmgm5Gr9kbxX6ZIH9+4jqzREycNxYECT7PBtFM7bn1b1WH1zKnB8E8hs8
	l5plYG25YuR7P/VUx2PjSKBSX3r6otJltWAYYz8XsPSqiC4fxPViNkn3cD/oXI3mz9O+KdroJV3
	bWXhTsOE2z6rVQQVtrHBC4OPV9ALhQRiFr3HMt1A40ksRSOYJa9HzMU0wookfU0/+QR9tlQP+oB
	3pvkOQWLyoRrvJ2wGiUJDcBLlIcHuXbItLCWQW+X2kKnytVkq3UdzP/HzGE4
X-Google-Smtp-Source: AGHT+IEyf/jfRZocce8XbsHKUc43T+JyTF/Sk4rwsW7yZtcHMwpngitvkGrHYV2zaS4TA5tWyxiyjA==
X-Received: by 2002:a05:6a00:1310:b0:735:d89c:4b9f with SMTP id d2e1a72fcca58-73bc08129b6mr1309744b3a.0.1744261608589;
        Wed, 09 Apr 2025 22:06:48 -0700 (PDT)
Received: from sid-Inspiron-15-3525.. ([106.222.231.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d6af12sm2320503b3a.80.2025.04.09.22.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 22:06:48 -0700 (PDT)
From: Siddarth G <siddarthsgml@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Siddarth G <siddarthsgml@gmail.com>
Subject: [PATCH v2] media: imx: Fix NULL pointer dereference
Date: Thu, 10 Apr 2025 10:35:43 +0530
Message-ID: <20250410050543.6963-1-siddarthsgml@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cppcheck warnings:

drivers/staging/media/imx/imx-media-fim.c:79:6:
error: Null pointer dereference: fi [ctunullpointer]
  if (fi->denominator == 0) {

drivers/staging/media/imx/imx-media-csi.c:795:27:
note: Calling function imx_media_fim_set_stream, 2nd argument is null
  imx_media_fim_set_stream(priv->fim, NULL, false);

drivers/staging/media/imx/imx-media-fim.c:388:3:
note: Calling function update_fim_nominal, 2nd argument is null
  update_fim_nominal(fim, fi);

drivers/staging/media/imx/imx-media-fim.c:79:6:
note: Dereferencing argument fi that is null
  if (fi->denominator == 0) {

To fix the issue, add a check to validate that the 'fi' is not
null before accessing its members.

Signed-off-by: Siddarth G <siddarthsgml@gmail.com>
---
Changes since v1:
- added "media:" prefix in subject

 drivers/staging/media/imx/imx-media-fim.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
index ccbc0371fba2..25f79d0f87b9 100644
--- a/drivers/staging/media/imx/imx-media-fim.c
+++ b/drivers/staging/media/imx/imx-media-fim.c
@@ -76,6 +76,9 @@ static bool icap_enabled(struct imx_media_fim *fim)
 static void update_fim_nominal(struct imx_media_fim *fim,
 			       const struct v4l2_fract *fi)
 {
+	if (!fi)
+		return;
+
 	if (fi->denominator == 0) {
 		dev_dbg(fim->sd->dev, "no frame interval, FIM disabled\n");
 		fim->enabled = false;
-- 
2.43.0

