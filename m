Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63F6390231
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 18:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314483; cv=none; b=SdwJLQbxCdunoJRT/3EvbYIaxdckIK/cecB3G1eeTCyBn5F39Rb5F3vauOMSmMoZhTaU5SI5CsT9HS6LxHj9im/A+iudLS/OXM2Gj6WRLDOikzKu2UMo+Tg4BYpocFGrRci2vQlcz8cUGAmxh9uP/7LFdt8Fiabf4d5ZwpXKPF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314483; c=relaxed/simple;
	bh=ROTMrQqSttTxafW0J8gXmxe+gSVA57/dLqaXxiwNinc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AtQqjbJ016VkMFsyX6mKM4LiiQl8r7HB1LelxSfTLOyIZyYuC37iOaJVEhytv4/nd1EUuvRjffaC9a66KyhDFY4w5bBFhvQ1Y24YO0gANp6kB5LZMXwB07RVJfwGU+Ms3zlapSbxe6I+DC10Yi6ZoRF3ueiBkzW+y+nXCAAUGy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnG1cevW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnG1cevW"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c16794450aeso415709566b.2
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 11:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784314480; x=1784919280; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F6thkEGbOZ+dYBijCCkAIWUHhU6Pl4eSv234AOR307E=;
        b=CnG1cevWHYOO13idxK6xadS6PIBWEtnzDHnILPN+fAxLNzbQhUUtcjV3nAnIrLwBv2
         CBvEVlczdBH40q0d7OpcdEaopDQtrv2TkNSTJ6yNlT/uVpkG7zj1SscbToIIUBmQvuQC
         hL9eMGtmUITlXQ6pUt+Fdy1wpKxLGOgQixqD7t3PkARrlcJ5y8ZsPOGNOiHihdR75Cv4
         G0zJCEGznyUzQqLbrfs24eArgPbCwntOhaAT8MBjjv39YJCaqjxMmORcvVf08MJ3vhlo
         xkI2zKHwclvykHCj4xL0rgU6WHaUrdR0ZcpwA/JtaLy/LLH5E8jwLi4P8sL3/nB/3mQ1
         tI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784314480; x=1784919280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F6thkEGbOZ+dYBijCCkAIWUHhU6Pl4eSv234AOR307E=;
        b=PMvZpdOVznr2IglmlR0oFucensr9t6M5euSOwlmNRx5CDl3/BCL09veTWbkF6LH0Ae
         fckVIS3yULvmmYhlv60UJHF5dXaJSBGRBrHFL0gOlkKmEfnszwiCiexx1WDY/ZFAufee
         TgfvV4hoHDSSoI+rJ8TwlUb4yU2YF4lHfpntzH0dXipwIXyUgURH3yZimAoJG8gGPcHj
         eRVA8SdmIRIPRHeBwP7yQC9j7uO3EFlqTa5+nBk84RrdwVsP7gD8Syw92FXyvVgAJUF5
         j7AFxxNN87IR86nm8jMT9cObGKaphoNrXSmwUge6zONLQ+6kg3GeNKSOFO6b/1QB7MwB
         GhlQ==
X-Gm-Message-State: AOJu0YzLaJGLk7ET9Z+jB68o9Go7qjrsQAacB+F54sV+7ehNfoRCYkix
	BuSNwivUa4xNuQxqcgWhW2BLVvZIheh7XSfji8+TNnDZYq344CTDDPS95OSKpQ==
X-Gm-Gg: AfdE7cnM6aUCcvNo8bt7QlC5DOjXhg+8e9znhbNjT+vUg/Csw/cYv7xCkiEBPhVBNyP
	Ssba1dQNBWsvLgLbzuvOmThOqLwQp9rMRh4xzO7a4lwjZpmyEk0NAxR4ZqpdiYNSnI9NwX/v+Oj
	y550KSzacNKnCsnOdrCZ6w2jf4w2bqop0siGTxLyoyXBKaRIF8HujyftxYLM+5kXIV8SCiFwirZ
	cZYQJerYVXO4C7/AIGz9Nrhop7R9yk+eTGKOHDVRoSZYlZN7dRhqV3pl6pM3VKYAc7TwL8Br3Sz
	PDcp/WKJ0vkRNInOX98WCqJJGJkK8KWFGey6XiC3ydzfXqiZfq9a/TohKvXIh8xy7Tbz2kpfj58
	1yqmyHZNNVV8hFfEe5dJLuSaxDkB+mCPJpAXWdRaMipFLJ5oUB89WZyw17uLgSF+hzLMm/fRQhf
	7LN47M6jhA73k=
X-Received: by 2002:a17:907:e1c3:10b0:c16:579e:a0f5 with SMTP id a640c23a62f3a-c16b48444d7mr119539766b.58.1784314480170;
        Fri, 17 Jul 2026 11:54:40 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm118622666b.34.2026.07.17.11.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:54:39 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 9/9] staging: rtl8723bs: remove debug fields from hal_com_data
Date: Fri, 17 Jul 2026 21:52:08 +0300
Message-ID: <20260717185407.56513-10-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717185407.56513-1-nikolayof23@gmail.com>
References: <20260717185407.56513-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fields are never set. They are never read from, since
GetHalDefVar() function never receives the neccessary constants.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c      | 6 ------
 drivers/staging/rtl8723bs/include/hal_data.h | 3 ---
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 80a775437751..2c856a2721b2 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -643,12 +643,6 @@ u8 GetHalDefVar(
 	case HAL_DEF_DBG_DM_FUNC:
 		*((u32 *)value) = hal_data->odmpriv.SupportAbility;
 		break;
-	case HAL_DEF_DBG_DUMP_RXPKT:
-		*((u8 *)value) = hal_data->bDumpRxPkt;
-		break;
-	case HAL_DEF_DBG_DUMP_TXPKT:
-		*((u8 *)value) = hal_data->bDumpTxPkt;
-		break;
 	case HAL_DEF_ANT_DETECT:
 		*((u8 *)value) = hal_data->AntDetection;
 		break;
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 6c8664b59d2f..f67ca496902a 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -234,9 +234,6 @@ struct hal_com_data {
 
 	u8 u1ForcedIgiLb;			/*  forced IGI lower bound */
 
-	u8 bDumpRxPkt;/* for debug */
-	u8 bDumpTxPkt;/* for debug */
-
 	/*  2010/08/09 MH Add CU power down mode. */
 	bool		pwrdown;
 
-- 
2.55.0

