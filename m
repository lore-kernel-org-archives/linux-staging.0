Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B3F3FC3
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 21:24:58 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id x6so7947389wrv.13
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 14:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=odmscgsatQ8+oNWe7+/hsee6MsXCSaqxsyPuZo1ZOyc=;
        b=LD9IAM08AoX4xYOWefBzcwZgbLnWN2vsm19032Zdgz0iuzaiH6+wzwWRzB+DwSC44D
         vMwqt7UReddw+0YQojFa/YyV/6dD9tgLh3JmxnLyHrVOdorJMK7wXWcC9sU7paAEgk6O
         fO9Q5lJRCIIUSS+HD8CU7OTNwxtVQXu0XR/47cgC7AbFHETTTpCOvsIyUX/gBf5cbrBx
         HyshjbNHUK39N3XY4g6i8T2ADjZN/5s/oktnpZePHPoRQsnk2M7NtjpL6HvYxieCO3oI
         yZohZ56SXlHuRTlG9RKwqV6fnm3B+xMBehzTeda903Us8Z/oZ8yHmJqCXPgAebpTK+vk
         q9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=odmscgsatQ8+oNWe7+/hsee6MsXCSaqxsyPuZo1ZOyc=;
        b=K9lVtd/dXQaum9N4HjhOBEa7w8mk03IVV2ZAgkm2TGim4VsPWKZL1PewuMBmZL6/Uk
         9zuH8JBcFYQ37q8dGRPg8eXSab6K1Q6mV8WFnVoHb4Sg2KhgBVxmOA6dKwv77kvAKmvY
         t2D/QySNk1UKYjrAKm5ELkt9kep3L/x697XnSsmXJRV3p7Jt0t55G+ZekxcxrELm/7hZ
         jPkMmk/yOB83jcj8hBtejWcEeZ/0UWZMvOryldhTEUv1jDKrcko0U5RPTzt1H7kYwC/F
         1SD1cAFrIhtIUPo/JqU9Ru7Talo4ZFvlJx9RKeZt0e4UjnLor4iG/8CxpVedUZcu6wwI
         6Y2g==
X-Gm-Message-State: AOAM533iHPE9j7ZbqEiiJuKURkARpwdH1nyaxIDpZJnxx4JAG4fuxQIW
	biNiYfj7t4RMjVh6mzXm/+sXKA==
X-Google-Smtp-Source: ABdhPJyp1xaWuDkKsOSw27yWD0xtDXRQNgcIRKX17qEvozirHwp3HOviYIB3oqmyW3pJGrXTraEiUg==
X-Received: by 2002:a5d:4c4c:: with SMTP id n12mr17838524wrt.19.1630185896628;
        Sat, 28 Aug 2021 14:24:56 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id u26sm8645847wrd.32.2021.08.28.14.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 14:24:56 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	fmdefrancesco@gmail.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: r8188eu: simplify c2h_evt_hdl function
Date: Sat, 28 Aug 2021 22:24:52 +0100
Message-Id: <20210828212453.898-3-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210828212453.898-1-phil@philpotter.co.uk>
References: <20210828212453.898-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify c2h_evt_hdl function by removing majority of its code. The
function always returns _FAIL anyway, due to the wrapper function it
calls always returning _FAIL. For this reason, it is better to just
return _FAIL directly.

Leave the call to c2h_evt_read in place, as without it, event handling
semantics of the driver would be changed, despite nothing actually being
done with the event.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index ce73ac7cf973..b520c6b43c03 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1854,27 +1854,12 @@ u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
 
 static s32 c2h_evt_hdl(struct adapter *adapter, struct c2h_evt_hdr *c2h_evt, c2h_id_filter filter)
 {
-	s32 ret = _FAIL;
 	u8 buf[16];
 
-	if (!c2h_evt) {
-		/* No c2h event in cmd_obj, read c2h event before handling*/
-		if (c2h_evt_read(adapter, buf) == _SUCCESS) {
-			c2h_evt = (struct c2h_evt_hdr *)buf;
+	if (!c2h_evt)
+		c2h_evt_read(adapter, buf);
 
-			if (filter && !filter(c2h_evt->id))
-				goto exit;
-
-			ret = rtw_hal_c2h_handler(adapter, c2h_evt);
-		}
-	} else {
-		if (filter && !filter(c2h_evt->id))
-			goto exit;
-
-		ret = rtw_hal_c2h_handler(adapter, c2h_evt);
-	}
-exit:
-	return ret;
+	return _FAIL;
 }
 
 static void c2h_wk_callback(struct work_struct *work)
-- 
2.31.1

