Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2666E
	for <linux-staging@lists.linux.dev>; Tue, 23 Mar 2021 11:35:49 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so10003917pjv.1
        for <linux-staging@lists.linux.dev>; Tue, 23 Mar 2021 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EEklaGbWfb1yo1FO7Z4wlaHPpfFsNPyJGcvRz1oeefM=;
        b=b5naPsgQpGmYSNTZQEtpOVUOEncxeX6nHd+zt5WJrai18i4iXngstNQKAZcgcgXW36
         oAUvlnuRnUWzIMG4JOvHaMPlshJwY7/rLJY4NKPei41RC8wofdNKmbPe7XAY9ocA9hUj
         Z5NylNkIvmpfwT/RE7dQBaqSDE0r5R3kGBXiBXwy4lGQok8qO0hRnAMfQUQd0c2nvX3R
         qKjqlQKHPfa3iWzGsPgZtMmxekYWahvC8VirPvT0mhucwlDqIZQGFFfXF1ubFIn9H/Tu
         KIwfOzdE4tq4CRX+S5iva+wc7PZYVNNm8ZqXFQ3B4s/zzn5E5R5lDMqYmG347gygEOix
         3BlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EEklaGbWfb1yo1FO7Z4wlaHPpfFsNPyJGcvRz1oeefM=;
        b=cb2ZuGlmrzbBWqxrxlveqK9lq9s7lRn4L8AH+wlwVm2ppC30c3CK68tgk7eFJxl5VZ
         1I8rPL/5j5S+jAR3rRZIM/GXqwoAM8gz/bHJj6pAJiy/epYSAWcJQ1IDXgXjdYMUNu6m
         O3uOSujuSbX1s00GWs3Y4gcMMnK3sCTn0eSiM0/jSRNgHEn6KCu5Gl1EzgumrWR9MvJ9
         DRw5+FsvyIjloCIvooZUv/i5acc/pGKlJtRT0kW3rE0toMZ7ZNBQwT/tTosdWha3bE6x
         Sk/UCjcXO48DHMjtQG0AQTx2WdfiJyiGAXQEffR4+PRDl6h6WNUW7FSX+w4j0JZETquI
         NxMw==
X-Gm-Message-State: AOAM533uMzQvzRy0JiGG/eNwB5G3DVcAOoy50l08ksECzCbF2nFl6kLW
	w8gVgMcCoA+ddXf+IdKaH7o=
X-Google-Smtp-Source: ABdhPJyfnT0JqtXQArzGmf6c+wju8uckrWOxq3OUqeecMhVAl0hDKux9CILkfrbFR7IfsAr+cqNMxQ==
X-Received: by 2002:a17:90a:9103:: with SMTP id k3mr4267739pjo.157.1616499348929;
        Tue, 23 Mar 2021 04:35:48 -0700 (PDT)
Received: from localhost.localdomain ([122.174.244.83])
        by smtp.gmail.com with ESMTPSA id l22sm2750385pjl.14.2021.03.23.04.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 04:35:48 -0700 (PDT)
From: Atul Gopinathan <atulgopinathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Atul Gopinathan <atulgopinathan@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] staging: rtl8192e: Change state information from u16 to u8
Date: Tue, 23 Mar 2021 17:04:14 +0530
Message-Id: <20210323113413.29179-2-atulgopinathan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323113413.29179-1-atulgopinathan@gmail.com>
References: <20210323113413.29179-1-atulgopinathan@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "u16 CcxRmState[2];" array field in struct "rtllib_network" has 4
bytes in total while the operations performed on this array through-out
the code base are only 2 bytes.

The "CcxRmState" field is fed only 2 bytes of data using memcpy():

(In rtllib_rx.c:1972)
	memcpy(network->CcxRmState, &info_element->data[4], 2)

With "info_element->data[]" being a u8 array, if 2 bytes are written
into "CcxRmState" (whose one element is u16 size), then the 2 u8
elements from "data[]" gets squashed and written into the first element
("CcxRmState[0]") while the second element ("CcxRmState[1]") is never
fed with any data.

Same in file rtllib_rx.c:2522:
	 memcpy(dst->CcxRmState, src->CcxRmState, 2);

The above line duplicates "src" data to "dst" but only writes 2 bytes
(and not 4, which is the actual size). Again, only 1st element gets the
value while the 2nd element remains uninitialized.

This later makes operations done with CcxRmState unpredictable in the
following lines as the 1st element is having a squashed number while the
2nd element is having an uninitialized random number.

rtllib_rx.c:1973:    if (network->CcxRmState[0] != 0)
rtllib_rx.c:1977:    network->MBssidMask = network->CcxRmState[1] & 0x07;

network->MBssidMask is also of type u8 and not u16.

Fix this by changing the type of "CcxRmState" from u16 to u8 so that the
data written into this array and read from it make sense and are not
random values.

NOTE: The wrong initialization of "CcxRmState" can be seen in the
following commit:

commit ecdfa44610fa ("Staging: add Realtek 8192 PCI wireless driver")

The above commit created a file `rtl8192e/ieee80211.h` which used to
have the faulty line. The file has been deleted (or possibly renamed)
with the contents copied in to a new file `rtl8192e/rtllib.h` along with
additional code in the commit 94a799425eee (tagged in Fixes).

Fixes: 94a799425eee ("[PATCH 1/8] rtl8192e: Import new version of driver from realtek")
Cc: stable@vger.kernel.org
Signed-off-by: Atul Gopinathan <atulgopinathan@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index b84f00b8d18b..4cabaf21c1ca 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1101,15 +1101,15 @@ struct rtllib_network {
 	u8 hidden_ssid[IW_ESSID_MAX_SIZE + 1];
 	u8 hidden_ssid_len;
 	struct rtllib_qos_data qos_data;
 
 	bool	bWithAironetIE;
 	bool	bCkipSupported;
 	bool	bCcxRmEnable;
-	u16	CcxRmState[2];
+	u8	CcxRmState[2];
 	bool	bMBssidValid;
 	u8	MBssidMask;
 	u8	MBssid[ETH_ALEN];
 	bool	bWithCcxVerNum;
 	u8	BssCcxVerNumber;
 	/* These are network statistics */
 	struct rtllib_rx_stats stats;
-- 
2.25.1

