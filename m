Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0575818E025
	for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 04:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785384765; cv=none; b=P/CS+DOmsfjV8VyhUD6QxhADFQBcvC3n7RIUjXH5wlLMJcqtud+FaMpPXEM1cy3+Ac4giKEGGU7BEsXdNf7k8QryvKX53Z6uALouo5I/16Y6OdzsLq0wDXnQ+4r9LOzaEu2w1dFIteM9HdTnM7acZbJu41xVXcbzND2HId0Bdms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785384765; c=relaxed/simple;
	bh=A8xI8/uO0nyr4mkTXdCUQtJZL8/Y+4SmdbbBQ+cYk9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lSLpn+ExjCIERda3FT6RDdwHPJxXfwjpdMjgszsnMjQQlfTSGqr5jSG+plqvGJe9QLB49cf9D6O3lf6CVlIfrmVC7iVspT7kl2NPqRedLYWBRfkAJL9vk4obrDxEtmQDsKLDy7OM3hgs6LDbx2tO0Fu3+ByyYwk1XUJiMwf4XIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sdHiCm4B; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdHiCm4B"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so1324317a12.2
        for <linux-staging@lists.linux.dev>; Wed, 29 Jul 2026 21:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785384763; x=1785989563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jY9HS5XLRtv5Lc9POKc9VtUHE0COzAXpfC43+pdnnFk=;
        b=sdHiCm4BmXme39V4nO+PY5Rm9kVpUinmxjAlUKhjm9PzVDX/p4++auuh4DKKoX12DB
         wE2Rb0C5SRyOZdhQ2Vpyrt40SjyAxbiOQPVCL/2mOOGdVjLqCaLEFDZi0qsqKTEdh8Ag
         I+Hy1oHA6/fkwIre9/JtmGwwj4pBXorJISxlmB2bzOvjxvWi2DLOz4hstSPRgOcehmvf
         8GS3t3SF6VFIOwE7699k5UN0lsT2voyZvwgNty5/C4RdWvOvUZyoJcliYPqrsxQtW/S8
         F42u5A9Kb/Dgq0EtMczrQrbpkCxsU9PswSI8ZfgrmZMDVqUeap331HM/fz06VbOoPDHC
         KZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785384763; x=1785989563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jY9HS5XLRtv5Lc9POKc9VtUHE0COzAXpfC43+pdnnFk=;
        b=FpA7q+cuPh2jsMW33kYqusIrsLBrEGdrvSEvuIFdkLqNFcHhHIFDHINHFAxQuHJCjc
         1qCqZHGCeVBZKvrrrSFq+hSR8ZHTnrlfJ7/Z/wEcKHpIZiKOx10a+6XKg9nkkMVZXscQ
         aTgdqLdruf1FqtLhcf2jLXEq22Sq6AmUAv1jgR/HZizhwcN+lrW8An1QPMPgmSd+ooLF
         QgJGSJKgjzjTrVSJ5hsFEe3v+PRJ059uW61RDc0iecoPReHlMr3gy53dLvheUc2NvkYu
         F4VUB2WVRYLCdUwpFe7aNUtWSMviBWwVW452+JX1tdZ345UvUEITAJG1lrbqyL7I3DgM
         n6BA==
X-Forwarded-Encrypted: i=1; AHgh+RrEEr/CklPhVNYO02ao4tFU/c3YcN/St6S81EOC+o1AsWGV8KSb0lbCjeEjEvnOx7q23pHT7zckdWMX/nyg@lists.linux.dev
X-Gm-Message-State: AOJu0YyFsdD2L6hh6juieCfJnYUIO3uc7YPeDNv5j9LUp9krkvgky+6x
	3P4AIdugaJRXeTX7jttxvtjLJATMMLjkvSBzwkOf+MqhTjDbv9Ru5uRg
X-Gm-Gg: AR+sD108b2iwwiTbl0ANj30aReMWmZhUs7LlQi7Xy0k/QncFFjjUw8ntkaccYn9qtKF
	WxnssVrn7ZEr8t7ZP0DqyACltkqzAUZGrxzSlaqt3syNE7waurpz378EKTAy9njX6VgjA8PRatb
	+2KhlqCJHmRCq1WDSIv4acZhmserYh6sVPjGBFq2EiBnYmFqdfIlSIdfbE4YyrysMkDgKWgxLkP
	2e99gNbfSwAcW8WhtEPU060HsmBRmAL26dbh0SqIF710CgQudldyIC0LBfM4edRydDRKJqO68j9
	ljvLLv7sMpV58s8XDUig+Ty1Dd9IT9kLtbMowGgxe1GbV8xMwjupcFQBWLSYDt41GBObBG99RKS
	yT+wpHBrN2EyPMQEHw8rhLIXaAfjZrCIYRksEt7D4xQYXJcXb/vNt7HYtA89h/409vzNPyHM02+
	DXHUGPPuy8nroIQL6a0xF/OZ12yU8GIhIs/ZzKQT0h6QU/ZHhfaadyYLXa4RSF4One6m6Rqmr2K
	rh9fxo=
X-Received: by 2002:a05:6a21:b90:b0:3c6:55f5:269b with SMTP id adf61e73a8af0-3c900a07f07mr911836637.66.1785384763304;
        Wed, 29 Jul 2026 21:12:43 -0700 (PDT)
Received: from ArchLinux.taild01bf5.ts.net ([115.76.55.213])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7262c23bsm13906182c88.1.2026.07.29.21.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 21:12:42 -0700 (PDT)
From: Dang Vu Duc Hien <dvdh12707@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luquijeffrey@gmail.com,
	Dang Vu Duc Hien <dvdh12707@gmail.com>
Subject: [PATCH] staging: nvec: fix out-of-bounds string copies
Date: Thu, 30 Jul 2026 11:12:20 +0700
Message-ID: <20260730041220.1064608-1-dvdh12707@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAObkL7P+PnkEBpav6AVEPTyjiWsoOEBobUT2hrR=fay23FyO6w@mail.gmail.com>
References: <CAObkL7P+PnkEBpav6AVEPTyjiWsoOEBobUT2hrR=fay23FyO6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function `nvec_power_bat_notifier()` assumes that `res->length` is
both >= 2 and within the battery info buffers.
Technically, `res->length` is provided by the embedded controller (EC)
and is unverified (ie. a malformed response). If `res->length` < 2, the
expression `res->length - 2` evaluates to a massive size_t value which
is passed to `memcpy()`, causing severe memory corruption. Conversely,
`res->length - 2` being larger than the buffer also causes an
out-of-bounds write.

Introduce helper function `nvec_bat_str_copy()` to safely handle these
string copies by:
1. Ensuring that it returns an error to the upper layer along with a
   `dev_warn()` message when `res->length` < 2.
2. Ensuring that it provides toleration by copying as much as it can
   along with a `dev_warn()` when `res->length - 2` is too big.
3. Guaranteeing a properly sized, null-terminated destination string if
   the copy succeeds.

Signed-off-by: Dang Vu Duc Hien <dvdh12707@gmail.com>
---
Note: Coincidentally, I have been working on this exact issue earlier
and had this patch prepared just before Lucas Jeffrey submitted his RFC.
I am sending it here to answer his protocol validation question with code.
---
 drivers/staging/nvec/nvec_power.c | 41 ++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index c514d51a9e57..12699515356d 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -117,6 +117,32 @@ static void get_bat_mfg_data(struct nvec_power *power)
 	}
 }
 
+static int nvec_bat_str_copy(struct nvec_power *power,
+			     struct bat_response *res, char *dst,
+			     unsigned int dst_size, const char *prop_name)
+{
+	unsigned int len;
+
+	if (res->length < 2) {
+		dev_warn(power->nvec->dev,
+			 "battery %s response length too short (%u)\n",
+			 prop_name, res->length);
+		return -EINVAL;
+	}
+
+	len = res->length - 2;
+	if (len >= dst_size) {
+		dev_warn(power->nvec->dev,
+			 "battery %s string too long (%u)\n",
+			 prop_name, len);
+		len = dst_size - 1;
+	}
+
+	memcpy(dst, &res->plc, len);
+	dst[len] = '\0';
+	return 0;
+}
+
 static int nvec_power_bat_notifier(struct notifier_block *nb,
 				   unsigned long event_type, void *data)
 {
@@ -193,16 +219,19 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
 		power->bat_temperature = res->plu - 2732;
 		break;
 	case MANUFACTURER:
-		memcpy(power->bat_manu, &res->plc, res->length - 2);
-		power->bat_manu[res->length - 2] = '\0';
+		if (nvec_bat_str_copy(power, res, power->bat_manu,
+				      sizeof(power->bat_manu), "manufacturer") < 0)
+			break;
 		break;
 	case MODEL:
-		memcpy(power->bat_model, &res->plc, res->length - 2);
-		power->bat_model[res->length - 2] = '\0';
+		if (nvec_bat_str_copy(power, res, power->bat_model,
+				      sizeof(power->bat_model), "model") < 0)
+			break;
 		break;
 	case TYPE:
-		memcpy(power->bat_type, &res->plc, res->length - 2);
-		power->bat_type[res->length - 2] = '\0';
+		if (nvec_bat_str_copy(power, res, power->bat_type,
+				      sizeof(power->bat_type), "type") < 0)
+			break;
 		/*
 		 * This differs a little from the spec fill in more if you find
 		 * some.
-- 
2.55.0

