Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C83946AA;
	Sun,  3 Apr 2022 16:42:56 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id 85so5911805qkm.9;
        Sun, 03 Apr 2022 09:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=NPyz/GS6BUUZMWinhofGh44+tVYJrswBvXwRBf0PcHY=;
        b=n0hujqeD0wIIwIJ4aK2UIyzjyZxztpDNUJsQSuj9MrnlIogzVJE6lKQqlJddunj5Fu
         Xzreby4FKejC7g/RUlUvJvdJXLv6rA4F/xrmZ9fW5IBdjOrH+Amnv8lzehx9+sOj6OZI
         Qh7bUuXsWNcbgGu3HCVe0kQQs7rBveZ69tdh1PljjSPiA7YPi/9bs0Xy8//oq/BFQ6DN
         mGGcGrndXi2VnzrXoAgdULXv5dwm57RF7nlOS5aplqHc3qZZdXVQ/D2GZWJ2o552iLGt
         pY8+fbt4d9uYJdK0vF+D96gjbRYJar+6w/s8uC2QEOPvFbBkDT5fmJRXQqV16iiWrGL5
         u+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=NPyz/GS6BUUZMWinhofGh44+tVYJrswBvXwRBf0PcHY=;
        b=vjAcTrPm3vodO20rhuOQyQ0LeDXnU5TcnUML1FQuJTfjfnfcpi/O1LxQdzpNuli0fT
         klx9aFyR8yaoC5eZtqRwz16vWf/74YBNi8kt6NTP6c98UsPShj8ZCsbHNOcbqxZcd/jP
         8yEnMv5GwpFV6Bu/I/yRCdAqdEtMcxub4U5liLfgOw1jKZT1MKuXYgWyJNHKe6zM+2Wo
         UZkgeBsSZI2E9RpmS6yKWb24o42V2rQ78o4TrbXowszL1k5cnmwHIm8vZKsHKAf5tPin
         4MwsJuFEjfmwEhENb6gbHjKlvx1QLBOafkYWazwvuS8sO6uUoB51srM9Alz0H1sQoMW6
         UrjQ==
X-Gm-Message-State: AOAM533yH4c/jktGpUcXXb3VafoNQIYL3PCeWiWUSpN+oPsUiEl0zGpV
	GFIBcJzRi+p6CTpPJtCAv+kQM7yUZRmuqA==
X-Google-Smtp-Source: ABdhPJzGsl945keh7APWt4ihJUAwUlkXHl0gVPQx3EpyNDxHoM/RBIlpA7n/WlAsz36Ag7YfEGhqCw==
X-Received: by 2002:a05:620a:2993:b0:67d:7119:9f19 with SMTP id r19-20020a05620a299300b0067d71199f19mr11670688qkp.494.1649004174988;
        Sun, 03 Apr 2022 09:42:54 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id br35-20020a05620a462300b0067e890073cbsm5489538qkb.6.2022.04.03.09.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 09:42:54 -0700 (PDT)
Date: Sun, 3 Apr 2022 12:42:50 -0400
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH v2] staging: r8188eu: simplify control flow
Message-ID: <20220403164250.GA371601@euclid>
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

v1 -> v2: Put the conditional in a single line to avoid checkpatch
complaint.

 drivers/staging/r8188eu/core/rtw_mlme.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index f94b1536a177..cddd8ab80236 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1637,26 +1637,13 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 
 static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 {
-	struct security_priv *psecuritypriv = &Adapter->securitypriv;
-	int i = 0;
-
-	do {
-		if ((psecuritypriv->PMKIDList[i].bUsed) &&
-		    (!memcmp(psecuritypriv->PMKIDList[i].Bssid, bssid, ETH_ALEN))) {
-			break;
-		} else {
-			i++;
-			/* continue; */
-		}
-
-	} while (i < NUM_PMKID_CACHE);
+	struct security_priv *p = &Adapter->securitypriv;
+	int i;
 
-	if (i == NUM_PMKID_CACHE) {
-		i = -1;/*  Could not find. */
-	} else {
-		/*  There is one Pre-Authentication Key for the specific BSSID. */
-	}
-	return i;
+	for (i = 0; i < NUM_PMKID_CACHE; i++)
+		if (p->PMKIDList[i].bUsed && !memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN))
+			return i;
+	return -1;
 }
 
 /*  */
-- 
2.25.1

