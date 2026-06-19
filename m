Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61981363C63
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 08:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781858273; cv=none; b=O2FS2TvwKL/MENneoFupZasJVXQBoZ+FBXAE2JV+A8MwUI3dN83crjdmKhB1Sfwaly7/+/gAqQQYJBMNbKuMNoVxUTAhWBSTK6Xz1dOtfqMsA5uPP9JqeFXwjJFTOXrq97BYBwBVPzEjdS3fjqlVGAIeDw4nKleD3BV0bxN/xRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781858273; c=relaxed/simple;
	bh=JwhLd6C4EL1pG+loXWaLrH7iFNpn8Mc0zdKHboVUUa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X0zaz/2SIihWg/zeVawhAW9tl1nFaDPfo3rs1fr8NSp1z7a/t427UiPXpIAlt7aQx+SOlJAhebvALT5QisR4L7dpLzvistpG981GN5ym0f7smTNa8KWSr6ZGfSIOIVu3RdZ62iPZnqa9+OEOsFHrwafWp/KFQiBJjxWeXrBj8Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXvn8JSG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXvn8JSG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so10763025e9.1
        for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 01:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781858271; x=1782463071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wDCvt7N8qVw/dKZW38W7SdYwCOXAuglkyb9SwufuZM=;
        b=sXvn8JSGWBcDZ7M6hqZ1duT9l36xmEPS/fq1dyg0++8H8suit47SWua0sguUepwqj6
         6GfDKGGJe7onLktZym3FW2/saiNkZ+nCYrVV+y/CkVw0QXmYHcgNRCHmUPzzljLQeLDQ
         6g6t/6+3fATZfAKorqmbYkyE6rrn+p/ghCMC6t/JNSjaaJsT0dC4goYiJXu40vNpty6m
         pYiJoNW8dAWTmVANurTBcI71k5UDdqAuQqOe/66+wluPFFT5m2HqUH2aYRtIt//eAtTN
         PeQ254xa2JIcopvj5mzFNNMwonzfLxYpHrGUo6fKQraBMn/8flS5rHb9e6mxdq4AGazb
         zJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781858271; x=1782463071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wDCvt7N8qVw/dKZW38W7SdYwCOXAuglkyb9SwufuZM=;
        b=Kf4w4HZrvxYM3VJzebnmQWFTwmJVuTICctsgvy6HbForV+3NOFIT6QXrJlW1bZZS6W
         LJSVnTKLam5d6DwVIzKEht8vygNQ742Yu8PNFElYoNhdAkfRJkj+HjSpXT9B8ULssctJ
         9NtZgGXo54GmRZCydTeU98PbNgT/HzbTgSrVGG/o80r3ntbnmx+3VRgxONluIWbah92g
         fTspTT+iuEGy0CGRm8T3kX8OhIMMfQZz01T0gpKq5ryexs99fIPVhxIVmTLoWkFwchEi
         FZOy2hKB4hA4J1v0xLHS4D6SNoPjNsPyNSoXYsymwckf59H//8dWTOnloxcRrhsihY0W
         htGQ==
X-Gm-Message-State: AOJu0YxB/8Pn4vh5jDwPSpDcHTH/1VrUSbA30XT9RTFIImOqoJFFCj9V
	X7+fqdnZP1w4Gy1wM8sOU0Rhn0/8UuagvzIGOAkjYbWo0Gjf6ktWZD/j
X-Gm-Gg: AfdE7clnMp+2S2ht1wFxSP4PssYmvXhWUSJlOkQxe4eSvYaX7x1NyFO7k0NuQAmxxK1
	SHeai7dkp3+MwEcmWQpA/CMeKD3JCsetW5cYyuhOudvTEXwGpXzP2Avs+avgI9jSFrCagXDe6UV
	bt6F5wPOoP8M2M9MYOuFsVNXSRUayBdv4N+GxXuEI6kKDgGigpXyPTu2LQFoRKRxLNhsEkLimA5
	JdWycFUglt/zUBsVNZd0ZJ+jl3DVHWVF4onVLkoYh5WqZrCAeTAF2YCR9ZYoOXGJ0dS1KNrFugj
	OWaRUsZuqf6htGzB1DY+7sonKdcGyuAVm9sniRlcLd/4TGP5pssjZtewkgOEAtwQgnYu2Sfx3ia
	N84i1ilmNftYdly9EV1QVDrg2VoaB5vUzQuXS7YYs4jjMdaAzcBd4zqZV3UYcMqqpZOFbye7iaq
	6xuOhcTUuny3I64Hi3ec0uACshu8xlnAjc/gRGvoCFsaobiahpw4CU7UIYliKRdAVHZ3I=
X-Received: by 2002:a05:600c:c178:b0:48f:d1b8:9ab1 with SMTP id 5b1f17b1804b1-4923ef5b803mr54946255e9.9.1781858270850;
        Fri, 19 Jun 2026 01:37:50 -0700 (PDT)
Received: from fedora ([196.112.134.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650c115fd8sm6062477f8f.35.2026.06.19.01.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:37:50 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: remove unused RF_PATH_MAX_90_8812 define
Date: Fri, 19 Jun 2026 09:37:36 +0100
Message-ID: <20260619083736.577096-3-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260619083736.577096-1-inasj268@gmail.com>
References: <20260619083736.577096-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RF_PATH_MAX_90_8812 which is a leftover from RTL8812
chip support and is not referenced anywhere in this driver.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_phy.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_phy.h b/drivers/staging/rtl8723bs/include/hal_phy.h
index abc0f27fdaa4..f7dfed0614d7 100644
--- a/drivers/staging/rtl8723bs/include/hal_phy.h
+++ b/drivers/staging/rtl8723bs/include/hal_phy.h
@@ -39,7 +39,6 @@ enum rf_path {
 #define	TX_4S			3
 
 #define	RF_PATH_MAX_92C_88E		2
-#define	RF_PATH_MAX_90_8812		4	/* Max RF number 90 support */
 
 enum wireless_mode {
 	WIRELESS_MODE_UNKNOWN = 0x00,
-- 
2.54.0

