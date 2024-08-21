Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358661531C2
	for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 20:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724273246; cv=none; b=oL0Bh/vkcHVDA/RzyQh58DHUjhOA+QyDb6ctChwq959dqNhhExtN4XYU8X+nkNer4Vb8dDdxdklsKgt0dPRhN+WMFcQvVp1fGGNsQbf4fzM35vwPlG3mo20m8SkmEKRsViOZ28HoosIcVZ0Hv3kWQDJRh90bywPAckueeEQED9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724273246; c=relaxed/simple;
	bh=OrtZ0RVvuy+pjSWGSjWMrnHBijQrCdEfai9HLUcT5gc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HcaEh5ad+ltqPrjvPa5Ycn66ti+blPVKXZYS3MXoZ464nXmPbwwk+lP1AeaKZwcCuF0eq2v9XBriq/lSy3zZgYhaG9crVqvch6WCzTE3XS1E2EoILMjiqa3HfME5LNzFxzOBnNZLd4dxhDtut8cZSuMhm2jPDteYUnBdFQtboRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lkcamp.dev; spf=pass smtp.mailfrom=lkcamp.dev; dkim=pass (2048-bit key) header.d=lkcamp.dev header.i=@lkcamp.dev header.b=QbPpBUFP; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=NxJxOIky; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lkcamp.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lkcamp.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lkcamp.dev header.i=@lkcamp.dev header.b="QbPpBUFP";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="NxJxOIky"
DKIM-Signature: a=rsa-sha256; b=QbPpBUFP1lDpchhdzyv2uoB+yrcygSqrpQlWUtTqWR8sy6Bn6UhV5Txpw/kEzmiz0R98FX+woKp6ILcj1tQ/w117zWvy7cvRPXxlVu+7fR2zHyIH3x0OJTG4HSCbEOsdL3/RV2bTOQtCJGTtk1acvqAt4o7Zmk3HsGppK5uN1+44MUFrOEfT+pRY8q12TBGsEPWsb3+gQgLwCSCT1XROszQObbV7jVlKjEr6I8S/Qm9KOW8UAeYEFYSuQ6QlTndqMlJ2qr1jyMqNau1hh1qEpJJeWZlvKaApWYIg6VAZK3sXEZydIpQc+BPBYzxJvkHMFA6MrExm6Y3W2CFS+IkVhg==; s=purelymail2; d=lkcamp.dev; v=1; bh=OrtZ0RVvuy+pjSWGSjWMrnHBijQrCdEfai9HLUcT5gc=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=NxJxOIkydz+qGwESrDmqX95GJ9YEKscU6ZCbMbvFmkIM3y53jRgQALfe6shqnqc6LdEMdj5TmDVC5MWVdlPibjQ8cAKcTeXqFlQdQnkxZNvXpobYe46TZn4d0deTsDBmOyTMAhjJHQ2et1oF7y5B75DFwnUSeH6odkAmMZKiPw76sYI6sDvXv8w2LUhL1QjvfKaQJrlp8WDWXF7XAin00s8S/ZLhYyDBSGynjFrFKbIqq1t9kx0C+KENSjR5ZlddTN/Wntz36kg6OsyVoo81CdTHTNMRl2L/DLNznf/UY1HrUwBEeA8O5brxuy6e6J8bpQiDe31vAmL+MSupk6O7sg==; s=purelymail2; d=purelymail.com; v=1; bh=OrtZ0RVvuy+pjSWGSjWMrnHBijQrCdEfai9HLUcT5gc=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 40580:7130:null:purelymail
X-Pm-Original-To: linux-staging@lists.linux.dev
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 434192248;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 21 Aug 2024 20:47:17 +0000 (UTC)
From: Vinicius Peixoto <vpeixoto@lkcamp.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: insert blank line after function declaration
Date: Wed, 21 Aug 2024 17:46:45 -0300
Message-ID: <20240821204714.5839-1-vpeixoto@lkcamp.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

This adds a blank line after the declaration of rtl92e_config_bb, in
order to fix the following checkpatch warning:

CHECK: Please use a blank line after function/struct/union/enum
declarations

Signed-off-by: Vinicius Peixoto <vpeixoto@lkcamp.dev>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/stagi=
ng/rtl8192e/rtl8192e/r8192E_phy.c
index 18b948d4d86d..9f1bde65fc0d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -416,6 +416,7 @@ static bool _rtl92e_bb_config_para_file(struct net_devi=
ce *dev)
=20
 =09return rtStatus;
 }
+
 bool rtl92e_config_bb(struct net_device *dev)
 {
 =09_rtl92e_init_bb_rf_reg_def(dev);
--=20
2.43.0

