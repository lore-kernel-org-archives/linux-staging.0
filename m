Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127142797B1
	for <linux-staging@lists.linux.dev>; Thu,  2 Oct 2025 17:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425847; cv=none; b=Wc4GjKOTMCvO8vsBrxzEVWfKNUN5CkFXgBHX8RhpMhktAX1LKG4XiwyVv9o41T8SBQ7BJ73yBbBm5mxu45o9mbOx898csxTU26vhOgmf6WTlA2SU5Bayg/ObzjFKt4TElICfm6ByS2GRy2DHkmY81R8yAqyLspigfYP2yebJDz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425847; c=relaxed/simple;
	bh=ATTvKT9SOu1K3f90qlHNHHc8Khy2lA/f7wW9AaZ37Dg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nQCo9ixq73iMxaZhtsmCsroasnCnZP2FmYoF8DUB2ZbpX/DKhPAc0eIAGwmYJ4k75PQkv7cNbuWOQRSWnjfi3afeF+4+Cu0brGyxmpP0hyG3BamjtdZpZtm4OmZK0ixzufsHaZ5lqXogKju2FjMd/rSLrOsSQj+cMmAEFrBkFoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UN6sX5PZ; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UN6sX5PZ"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4df0467b510so17249751cf.3
        for <linux-staging@lists.linux.dev>; Thu, 02 Oct 2025 10:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425844; x=1760030644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AXYwmv6wCEmhlrvJWgDw3Yc98hZP8kES5b5UPbVfCc=;
        b=UN6sX5PZU+6XJr/gfohY3W0emyJrzlMlF3bj82dUc90Ls7IMie/9TEIfMmAkjmd2C9
         gQ2LmB0Hr78C5FKVNOAhVio8uWNk35ErccN0Szv8holm/IDC3AvcmJ0v7OdpDLrlHj9X
         qWm703oe8tZpSbnnkoaUmmNpgQRkQx05mhjSWgab0buLpnHnmVRIO1qR+jSGowDfjufi
         Mc4EclpsKXlucZgjsmeGzayj38/qYJzaTw/3kgXk9vT4nvtuIlmqNlMo63jyIoAECK/k
         9KWeFLYb1mvO4c8Nc2+xxPJpNI4VnSKkpksV2VHKDVgDk4Jep5fGb/w+k9a6gqr0O1dk
         p5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425844; x=1760030644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AXYwmv6wCEmhlrvJWgDw3Yc98hZP8kES5b5UPbVfCc=;
        b=XMNZBT3AB5C3HTR9J4zd6U7uOCjKEzrJWoYWtpyDN6psmWhG+lu7AlU74l/2Vrut0U
         1bb+pVVd8psX8h4+8zfg3yvHFvnzuBbj5x4b2VMV0ElYi1WZ3w1zZM//KYmAjNKgIMhX
         iwipmvCWxuCr33VbqqaP+t014jkYQ4xnzut3GynRAFRsd01G2SSY5WcKmxGf86XsW9U3
         RHMXts2a8/KBXjWEeKIXMbNlJlHNlQBWstn2KExV5jBLL7MlyHLyCn9QTY/kDEjD7Umg
         cSntcdX2V5iOoqSBmRRpF1+4WKXvZV0SA0Okik2BpvrWpRPg/3YLw0K7cA5AyazCeYZs
         INaQ==
X-Gm-Message-State: AOJu0YyXGfT2BKH218SahyKIMgckbw9mvjWUQQoV46oVgkAMtwEhfwRR
	cVUftYZ6XU3UfOBi3EPuIwGX/AxOf1s6cfwK+UCjlQAky8tlpTHUuJPh
X-Gm-Gg: ASbGncuaqkq0szPdAwABUbck2RIdXFxBDFIudCZy0Vj0IxRs3zjSCELtTVOJp8dEqRw
	zNtXGHYYld6eYx+9bygkTJAIaaACJ/QSSVslgpYdY3xgnemRUD1BQopBqGuOWI6efi/Qv3P2u7n
	Br7qnxN5SipH/7Y4jxbpN/owQ/bJ+HA1xPPUpvzvsfpf3R9YPX2i8nRcfuG8f7rvgDk6zoSVKX8
	8tfJWc7N0a9EMJ2CS4R8xGI84IqQAxKzC33DR/663RdGipDdwY/ONuA31dYMz6Mt9Wbk5mh5kJd
	kv4t+DcUKP9sTFrjhrJddX9BSvOGiQVbZoiJ6rcZNg4yDnBX5jN5vzKbhV+TFKNCtg2XbJDdNGt
	U+ciV0j+13lscaA9+KpfA8P7dIq5nk0yIDKiT5OjiK9CY7zFGpTADxhiSOORhA6lUmndS+fWRcV
	5ZFoHmgWtctQ==
X-Google-Smtp-Source: AGHT+IEomTNfnx42+U8ksyK7456yz5jewC5upkUGjz4Pvkg3DTOJTuu9oYqPgnImEhEU3m+EreC23A==
X-Received: by 2002:a05:622a:5914:b0:4cf:440f:86c4 with SMTP id d75a77b69052e-4e576ae9f5fmr1124441cf.41.1759425843717;
        Thu, 02 Oct 2025 10:24:03 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55cbd3d9fsm24504971cf.32.2025.10.02.10.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:24:03 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v4 09/16] staging: rtl8723bs: fix excessive indentation in nested if statement
Date: Thu,  2 Oct 2025 17:22:57 +0000
Message-Id: <20251002172304.1083601-10-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
References: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust indentation in a nested if-statement to match kernel coding
style and improve readability.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 5d31684c7cf3..34fdef878b51 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1254,8 +1254,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
 					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
-						if (ptarget_wlan)
-							ptarget_wlan->fixed = true;
+					    if (ptarget_wlan)
+						ptarget_wlan->fixed = true;
 					}
 				}
 
-- 
2.39.5

