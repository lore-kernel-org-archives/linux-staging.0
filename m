Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8BE42EEC7
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607692; cv=none; b=K0c15p/Yf7DmN5Qvnjx3OkyflquP8S/tfNXrzTKcZiqsq8/BcRRPRweJfIo6Lr0nZpfzJNLn4g3A5Bas/czeAn+EzL4pYD/arRBySMEQX5ojlQacBQjTaFaJpWcTrCckDfa3kgWvZaBK0ZuCOT3UuOptrjnpvjs8OcJAd8ZPSgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607692; c=relaxed/simple;
	bh=oMSc/HyuwSyaSBImWkmaV6pIEYGoISjzQ2xzLyOo5pI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jGovwzbIapuJGIgx9JG9iV4zWuRXviL50yZgtXPN1C22WBnagW6Qu4DjaG+1FiWvg18ewJSwtiPxadCHphBEgqUHYou5MzvFitO3Y23v8Sve+cmLKVGvfbd3jx5ZDXcufugIjocBQmQP0f8FP9eC4T0qqfDvGkBq6WrVzkXxvz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s7T6mU0D; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s7T6mU0D"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c31212104cso18135655ad.2
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 04:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781607690; x=1782212490; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23OiMMB4pQKDKr8GR49qhu2OtHIc+/lyNM5A33KYx4w=;
        b=s7T6mU0DSza6nUJ/77B9tBsTtmskgwtg0mXpQjVBtLwRaPAVJMsI2DKD+JvX2IeD/w
         bwE+B5dzR6h0K8jyQ2Wncc4brnAe7jg1eXDKR4ygo7/fKpwZsOzIb91YSqb5fH1vd989
         MaE3BUW9E4VbERg/07VpNlpVncdiMXAJPn2g2qWrl1yIuu8z2b69QOzms12WW1Oe+Lwl
         eIPxw5PiOjnWQoOv8EZUsO3J9JYsdZhrTgnfoAy4NOu9YioWE4EKNo6YnGGcQY3cwtnl
         Y1jsp7f6GQGNvoCz6TmFbKW9b+ZpgNSohcfPFPQ77q84oYAF+X6D726XvNcZwTzwbjtd
         3wCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607690; x=1782212490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=23OiMMB4pQKDKr8GR49qhu2OtHIc+/lyNM5A33KYx4w=;
        b=SfgASZx4OexGi7/KKbPMnniSrAWPNguq/KjrvHJ1R14bUf6e1nqb9TrMaUCWYNlWjI
         5O0Zn1GXcrXtH9+KAwUTqoEJ8ZJmo/B6TQCyItXj3w5Y61eh8zeOLYHVhvpMelb4a8Zn
         PAfKKFx56dDfJPwcSl0EVomJmdh/8uj6vg958PitL9A2WUvlxiUoeX9Xo5mii81zsB92
         gM+LEesiam2dUu0FGfVtvqbBwU2mfRXna24l5ekhF7urLaJbIrzxYICCmlCatBvnpQ83
         QRhw3BMbDWEV8ote3+PpxIm/InzfeDmmnxpE80D+35E8K/rIxOkjLuxH16t9E2FxbkHc
         Uo0A==
X-Gm-Message-State: AOJu0YwJBXvnkhFZP9HW/FQLrWQFN0zppI8eDuo4gLZdwrPHaoR9n0d8
	eShUgKzeGNPeMkQFthXhlvQNgbRBRvIW36CMYVNeohtg4ppkQX9VUqdL
X-Gm-Gg: Acq92OGqBnHLWZHClBKDZziyVj4yvGg+7SlNZf/pn5xL9LTgf4263l1M7Y3g78LqlgM
	4SJvi/ktMa48t2Vv84bHfEiqt1lZVfyAlfbeSSEi19CgrWyShS8CY72C4B5+2Q7Itw0NauJtFC8
	/jhHJSPPDPF/0J+21VGm7eIvArteWeWxwzp1kyoC5DU4fzqClv6HQuPIA3qa5o/njjk2xPsWUle
	R/cadyl4oDijvDiMGjRAOopzym9v6/8sGostlaQw3RpOIFAyPNmWAFVdTFtQE1CfHicn2E21xnM
	OIJz4arY+GrdiH74zfJ6I3S4+LKJQv140zhjyAk9pk8FBb3MgTq9ZhpwoEi0CWdSNb1/LxX6RLO
	NStR+6BBIUFmAqXyOp554Wk4RIyu1JvPzb34mzOZO9MbulrWzQqmfPr1SL/H3/tCSxsD6zaeI7u
	ZUT+BkRCY4ZSn1hGIaTPeuA2o=
X-Received: by 2002:a17:902:ea06:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c664271b0amr159943595ad.20.1781607690373;
        Tue, 16 Jun 2026 04:01:30 -0700 (PDT)
Received: from fedora ([103.51.149.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e52a9sm132561995ad.11.2026.06.16.04.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:01:29 -0700 (PDT)
From: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Subject: [PATCH 5/5] staging: rtl8723bs: Fix whitespace in comments in rtw_mlme.h
Date: Tue, 16 Jun 2026 16:30:48 +0530
Message-ID: <20260616110048.45541-6-subhrojyoti0609@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616110048.45541-1-subhrojyoti0609@gmail.com>
References: <20260616110048.45541-1-subhrojyoti0609@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove extra spaces after /* in single-line comments to comply
with kernel coding style.

No functional change.

Signed-off-by: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 59b12d9daa71..1b862ec24d36 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -13,8 +13,8 @@
 /* define   MAX_JOIN_TIMEOUT	2500 */
 #define   MAX_JOIN_TIMEOUT	6500
 
-/* 	Commented by Albert 20101105 */
-/* 	Increase the scanning timeout because of increasing the SURVEY_TO value. */
+/* Commented by Albert 20101105 */
+/* Increase the scanning timeout because of increasing the SURVEY_TO value. */
 
 #define		SCANNING_TIMEOUT	8000
 
-- 
2.54.0

