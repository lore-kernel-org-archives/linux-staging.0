Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234462C83
	for <linux-staging@lists.linux.dev>; Sat,  9 Oct 2021 05:20:11 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 133so5131183pgb.1
        for <linux-staging@lists.linux.dev>; Fri, 08 Oct 2021 22:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=TRbs+RpG/bJ1OltPUfWK5TostibOXaRSuhgVNbapoY0=;
        b=k2sTWanTnqYrUy3IFvhH2mcqNs0p6jkdCzVjoX3pUr+nhG7rfe2Icp1WyDLVzt4wPh
         muMQDYq/Jj26sKlKVcQmfksaiUOq5eUOwUmNOJbGxOfl0Bl3ZMLcXBs58f7KamMBATKz
         PJWMdM3P4udczCZgRHDD5+xM2RlqjbwbU7o+PgOXHoF4qN2VrXgAvwG9XDwCclb69hd1
         /9W3piqQ9qUbfGA6IIT0aBi4xm6cmvNiL1KRW5Y+j9xkRkbkNmzvR6ul0ed2UyjcSWWN
         q5k5DLAFU5UF9xSlSAc5GSFPcoeo32mFIvMY4ZdSVMril9VGpGoX8EpoQFi7lhA4lAYV
         GXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=TRbs+RpG/bJ1OltPUfWK5TostibOXaRSuhgVNbapoY0=;
        b=VY3u0X9fpPAG2GDlEpaYo4ge8OIAQ3aqv7rcYJVVpX5+NzUOrYE+am3SV2JMwDKpAf
         I8gyeULKDvZ4bA0yJEv65rdpV1Sh31MNkZeSyzNvGRcZnDh+6wVJkvSWkf+MOr2aLpEr
         5eCJtHeXlUPVnjMs1NPgtPOxjRk5spMVBw7bNgiNJxIM9cfnGBsHucXzJvWEzDl51oVg
         ikEzwLgmE8YrtXi7oeSuJq9I0MuA9TAytjkoAik8sWfLWE0gkt/vZdVUTVsgaxkKCEj+
         Pgcr4y1wvI9pDRiGc+fLDA0pUHdOfjQEbsYiu7qE8A5lK5T73hhjjqFywF4OLuMxZvxG
         Z//A==
X-Gm-Message-State: AOAM530gqs3aknN2dr4ydv2BsvMbAJ0soMhYcizYtvbY9l9pWL0EhzYL
	1hNyqHIeNipdHBidZ6s++0I=
X-Google-Smtp-Source: ABdhPJyCoL6N6rUUeGy4eq3W5yFHSPGpFuBIfsgzXN2zEsBpdEUCitL7AZgcrL4LpmkXBCGNCzkJdg==
X-Received: by 2002:a63:79c7:: with SMTP id u190mr8202981pgc.378.1633756810547;
        Fri, 08 Oct 2021 22:20:10 -0700 (PDT)
Received: from user ([223.230.43.197])
        by smtp.gmail.com with ESMTPSA id k17sm881666pff.214.2021.10.08.22.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 22:20:10 -0700 (PDT)
Date: Sat, 9 Oct 2021 10:50:04 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com, hdegoede@redhat.com,
	deborahbrouwer3563@gmail.com, marcocesati@gmail.com,
	linux@roeck-us.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8723bs: core: remove empty else section
Message-ID: <YWEmhBt3e0dNKl1G@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the empty else section in rtw_make_wlanhdr().

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 46054d6a1fb5..34505b35a7f3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -977,7 +977,6 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 				}
 			}
 		}
-	} else {
 	}

 exit:
--
2.32.0

