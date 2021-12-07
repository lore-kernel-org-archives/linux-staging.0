Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257DF2CAE
	for <linux-staging@lists.linux.dev>; Tue,  7 Dec 2021 21:22:27 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id h24so440830pjq.2
        for <linux-staging@lists.linux.dev>; Tue, 07 Dec 2021 13:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ju5q/8LdtV/d6IPSSjw+nF8L2cah7GfwEe7IizH6nS4=;
        b=O/caTuT/x4AJZXSEVDeoxnH+Zkkd8t5p1pMhH3V1MxoQrbSTXpVz//hXL6nKExvwyN
         HxhqTCpEtUZ/pA/rCNt2cErq7+5mDf6OUNJgrH7ka60/MXDu588FjRQ/I5ZIdqyJqgK/
         +Rc0sAxigHplMeiPhHG0fOe3Dl1/3VYn/aqKDnsZydu07AxikewwFwJs+06hYhsgCGA8
         8ONKLhJViZkNJGx//Y+wVhsq4aq9nep9LXvqBQZbE/OVyMnGhpWp9ear/9byEyqfduUt
         inMTECmsNO0H4vv66KXHjMEl3FPZERX6PYk9FhHVusUWWgEgUFO9j8K58qKb9R8Zc1LM
         OqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ju5q/8LdtV/d6IPSSjw+nF8L2cah7GfwEe7IizH6nS4=;
        b=izL9d+Mk1mL9adGnn4dpwbi4rVjrtJlXG0GUcZDlZWYwQ4Q46BcpeUU+APHQ4HzdBX
         f45rTuhQ0CezHB1M8R0CP/VqxRyNHeyr8NrwuAxa+UuPiW/zWt0Ui3SJz/WftZjbD5K/
         +EXc68yr343HUMu//Q/+UFtovgosQMoOjLH+sPRp1SyKlxM4fDM9LryNywsxZnEszg/n
         vTxWlYKxJxO7uJv4YsX54KFd6CgNR5n1ruO1hDBhfkls4HDOPDnG+XrdUN+vjdB7DlY6
         atF73A3kZn1VRP9i7GJnpvUSiBZU2ObvfNcb1RKnfzE/9e7EO0WSp03G5hyi0QNshXl9
         hABw==
X-Gm-Message-State: AOAM530ilRNQSSLUW3AwHkHvP49Gn7lYTXNK7JpUsrt1IxT0hGBJxmNR
	TPNd46dC0QzwFU5k1WQmO5Q=
X-Google-Smtp-Source: ABdhPJwLkQCaWF8wwFDCO+7EEp9cQjbVj8dWmjPzDL1UCjffJYDVTNzdB1rirFX0hfnZHtWBKVcWZg==
X-Received: by 2002:a17:90a:c58f:: with SMTP id l15mr2088266pjt.75.1638912146573;
        Tue, 07 Dec 2021 13:22:26 -0800 (PST)
Received: from simon-desktop (n112119139022.netvigator.com. [112.119.139.22])
        by smtp.gmail.com with ESMTPSA id p16sm698712pfh.97.2021.12.07.13.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 13:22:26 -0800 (PST)
Date: Wed, 8 Dec 2021 05:22:23 +0800
From: Ngo Tak Fong <simon.fodin@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8712: Fix alignment checks with flipped
 condition
Message-ID: <20211207212223.GA70594@simon-desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed two CHECKs of Alignment should match open parenthesis and flipped
a condition to pull the code in one tab.

Signed-off-by: Ngo Tak Fong <simon.fodin@gmail.com>
---
Changes in v2:
  - flipped a condition to pull the code in one tab.
---
 drivers/staging/rtl8712/rtl8712_efuse.c | 28 ++++++++++++-------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_efuse.c b/drivers/staging/rtl8712/rtl8712_efuse.c
index 4f3b54a7c3be..c9400e40a1d6 100644
--- a/drivers/staging/rtl8712/rtl8712_efuse.c
+++ b/drivers/staging/rtl8712/rtl8712_efuse.c
@@ -298,25 +298,23 @@ static u8 fix_header(struct _adapter *adapter, u8 header, u16 header_addr)
 			continue;
 		}
 		for (i = 0; i < PGPKG_MAX_WORDS; i++) {
-			if (BIT(i) & word_en) {
-				if (BIT(i) & pkt.word_en) {
-					if (efuse_one_byte_read(
-							adapter, addr,
+			if (!(BIT(i) & word_en))
+				continue;
+			if (BIT(i) & pkt.word_en) {
+				if (efuse_one_byte_read(adapter,
+							addr,
 							&value))
-						pkt.data[i * 2] = value;
-					else
-						return false;
-					if (efuse_one_byte_read(
-							adapter,
+					pkt.data[i * 2] = value;
+				else
+					return false;
+				if (efuse_one_byte_read(adapter,
 							addr + 1,
 							&value))
-						pkt.data[i * 2 + 1] =
-							value;
-					else
-						return false;
-				}
-				addr += 2;
+					pkt.data[i * 2 + 1] = value;
+				else
+					return false;
 			}
+			addr += 2;
 		}
 	}
 	if (addr != header_addr)
-- 
2.32.0

