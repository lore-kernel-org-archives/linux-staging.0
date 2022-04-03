Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05051FDA;
	Sun,  3 Apr 2022 16:53:30 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id b189so5914182qkf.11;
        Sun, 03 Apr 2022 09:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=HgjUYAn5zy8VBzEx1URiJxTFwjP91TAGQJx9luH2liI=;
        b=N68qT/clnRGCwOqBfHQ1AlXyxPbosDIBo8Znf5RG+rBhSLumUBaKqpJhPz4lvzOJNt
         jvAjAG9mZzc5WjH8kf07ZKHmpBO4pnZFpGX12lE5VKQf0bmGKSL8O4ck5+AEBNL9SpYW
         u+G9/Z9pPlkA/f4CIn349klUwzNwyqfT7oWb7IEKc75en/nK8Noq01FsiYxHqE5Ors7H
         zrXPIV2dlptNgKv8D4HVEnADJl7oCf7Cgfa0n5maEhBS991BvzTTLQ2Xbs6/bd9gIvDj
         Mb8ym5wtcQF1NT/BKbt9Kxt9wl00XYZO9ZfmlOwcNjmKVgggVebryqp/vy0Y7NOXlzQc
         FSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=HgjUYAn5zy8VBzEx1URiJxTFwjP91TAGQJx9luH2liI=;
        b=B/PLXrAf47CsETZP+L7fU0Bo9XDoWsSbiO/MvSbeWGm65yU6tPYa6NGXNsg3xRryoh
         sgPu0paCqjBmiAgvM/jdHtpXGv12U0dzxrcggH3ikEj83GKsL/0Bi75CYuWJz49ODwtR
         o8uCukkiG3gaSbnl7Lkat03hqrLMQT/JDLEYPfP9DIkJreQgMQNLE4C/u2UR4cO+iZW6
         AeRFC8nA8jfG/cMMhNRsUUt2HuMJ8lOiqrW7aM0yl/Jn2xcj+iwjSVY7aMT0Ou4KXXAy
         RLhxksdIdLMx/Lgzxj9xfTM8EhTuVXVNv3WnpL9u/02W5pv7vf2wXL3p2W6t8bdTsRn5
         zHkg==
X-Gm-Message-State: AOAM533DE5pe2eWuDmn4UDHkIJZVvmHZd+hkDW7QjgttClQwI6KpdIxf
	B/KnkJRb9pfZqvedOT81p+w=
X-Google-Smtp-Source: ABdhPJxXQkphHAz1KxoUaxLPZjI0+Y0VrwkwA15r7Q4wX/m4VLWX4zqgErzdRgGbp43LvfSs3B+HUQ==
X-Received: by 2002:a37:b906:0:b0:67e:4497:c3cc with SMTP id j6-20020a37b906000000b0067e4497c3ccmr11943914qkf.260.1649004809714;
        Sun, 03 Apr 2022 09:53:29 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id 78-20020a370551000000b0067e3a58c090sm4771733qkf.82.2022.04.03.09.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 09:53:29 -0700 (PDT)
Date: Sun, 3 Apr 2022 12:53:25 -0400
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8712: simplify control flow
Message-ID: <20220403165325.GA374638@euclid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The function iterates an index from 0 to NUM_PMKID_CACHE and returns
the first index for which the condition is true. If no such index is
found, the function returns -1. Current code has a complex control
flow that obfuscates this simple task. Replace it with a loop.

Also, given the shortened function body, replace the long variable
name psecuritypriv with a short variable name p.

Reported by checkpatch:

WARNING: else is not generally useful after a break or return

Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_mlme.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_mlme.c b/drivers/staging/rtl8712/rtl871x_mlme.c
index 92b7c9c07df6..b93b33092932 100644
--- a/drivers/staging/rtl8712/rtl871x_mlme.c
+++ b/drivers/staging/rtl8712/rtl871x_mlme.c
@@ -1284,26 +1284,13 @@ int r8712_restruct_wmm_ie(struct _adapter *adapter, u8 *in_ie, u8 *out_ie,
  */
 static int SecIsInPMKIDList(struct _adapter *Adapter, u8 *bssid)
 {
-	struct security_priv *psecuritypriv = &Adapter->securitypriv;
-	int i = 0;
-
-	do {
-		if (psecuritypriv->PMKIDList[i].bUsed &&
-		   (!memcmp(psecuritypriv->PMKIDList[i].Bssid,
-			    bssid, ETH_ALEN)))
-			break;
-		i++;
-
-	} while (i < NUM_PMKID_CACHE);
+	struct security_priv *p = &Adapter->securitypriv;
+	int i;
 
-	if (i == NUM_PMKID_CACHE) {
-		i = -1; /* Could not find. */
-	} else {
-		; /* There is one Pre-Authentication Key for the
-		   * specific BSSID.
-		   */
-	}
-	return i;
+	for (i = 0; i < NUM_PMKID_CACHE; i++)
+		if (p->PMKIDList[i].bUsed && !memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN))
+			return i;
+	return -1;
 }
 
 sint r8712_restruct_sec_ie(struct _adapter *adapter, u8 *in_ie,
-- 
2.25.1

