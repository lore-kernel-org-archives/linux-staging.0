Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CB32FAD
	for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 09:17:26 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id ne24-20020a17090b3758b029015f2dafecb0so7277171pjb.4
        for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 02:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gvZwwQvUozYdew6IFl81osVHRpyCjUoO7aQ/6DwGRco=;
        b=OItHjizM2uwpWjAQGOGD2JTZYrW2uWjEH8Ao4T/K1Ftn9qHd9pBkMSveKNloAH/+yp
         M7oOPuxKLv0eQ5y5wZxDQJJuW+cs7taoKwALuwMhF0XY55xFtkuQqX/vyBU09zyHY2xx
         QRJU2FS9nvH6NZMMVmUTkcRJVPfSF3YoLpZQFeX03fdcUF1bzqDRScEwP2KrgxaQtITS
         aiRJnkyZ6dAKu7R1YnFd5IpJ1WbmeFExaSQnf7d6YRfM3fnPvPBAKBb0YcbFtHrTml1r
         bR6PUCsOylJiIjpnqSzL+/bWRR20AHiVQwLvUw4bsmsJZ107gJh1BMBnRDCMTnbSwnW/
         ZvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gvZwwQvUozYdew6IFl81osVHRpyCjUoO7aQ/6DwGRco=;
        b=ly3GMtL9QvOsvSo51gs+g/jGow2VQ1m0/0XMpa4QQIS8apVu4BfvSoyydaJXLyLXUQ
         nJdF+CQxbKCXi/AjQC3fFE49Cn+McgeE/Qp6lebWUHJn9cfNcYb7lYp+p83+f6VruSf1
         WmfKMR16s/bj7YNingRT/wg0RNkVJ5Kr1wC2NwLIK7pyIYNP5OqlBR9Z8VaQ+80yUdz1
         xtMs/2WIk7XNJEPxwKjFHTpFhXJNOKlFwTGW9XZRuDKn7NHYOPPkWo1sJ3jZOi87MUXj
         sV6gOUq1P2Xkwhttngejdg6fZbnTwVMWq/pU7pzZbEHgkVCThcThpjMh9SmgE+KyPCf5
         Zkjw==
X-Gm-Message-State: AOAM531XYUk6jE3OODBeYfJidsAf/k+KCdNfktL8UWTzDsHpotlw24/q
	1GK3OiUufRr3vyEN4oqP0Tg=
X-Google-Smtp-Source: ABdhPJwOtqYwoWeZ++0/XrgAaydy9u7rnN+FjcV0q7rRPhRVEjvtmsluIb/iB05qEqjBMJb50kAZWA==
X-Received: by 2002:a17:90a:6e03:: with SMTP id b3mr15452997pjk.12.1621675046054;
        Sat, 22 May 2021 02:17:26 -0700 (PDT)
Received: from fedora.. ([2405:201:6000:a04d:2131:362f:d566:c9d5])
        by smtp.googlemail.com with ESMTPSA id e23sm6334224pfl.84.2021.05.22.02.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 02:17:25 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	straube.linux@gmail.com
Cc: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@bger.kernel.org
Subject: [PATCH 0/2] [RFC] staging: rtl8723bs: refactor to reduce indents
Date: Sat, 22 May 2021 14:47:17 +0530
Message-Id: <20210522091719.64277-1-chouhan.shreyansh630@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series tries to fix the following warnings by checkpatch.pl
in core/rtw_wlan_util.c:

WARNING: Too many leading tabs - consider code refactoring
#887: FILE: rtw_wlan_util.c:887:
+                                               if ((edca[j] >> 16) > (edca[i] >> 16))

WARNING: Too many leading tabs - consider code refactoring
#1529: FILE: rtw_wlan_util.c:1529:
+                                               if (pIE->data[5] & RT_HT_CAP_USE_92SE)

WARNING: Too many leading tabs - consider code refactoring
#1537: FILE: rtw_wlan_util.c:1537:
+                                               if (pIE->data[6] & RT_HT_CAP_USE_JAGUAR_BCUT)

WARNING: Too many leading tabs - consider code refactoring
#1540: FILE: rtw_wlan_util.c:1540:
+                                               if (pIE->data[6] & RT_HT_CAP_USE_JAGUAR_CCUT)

I wanted to ask for comments on the names of these functions and if such
a patch series would be acceptable.

The first patch refactors the code by introducing two new functions
sort_wmm_ac_params and get_realtek_assoc_AP_vender.

The second patch removes unnecessary braces from the conditional
statements in check_assoc_AP function.

Shreyansh Chouhan (2):
  staging: rtl8723bs: refactor to reduce indents
  staging: rtl8723bs: remove unnecessary braces from conditionals

 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 141 +++++++++---------
 1 file changed, 72 insertions(+), 69 deletions(-)

-- 
2.31.1

