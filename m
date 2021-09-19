Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E1972
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 15:37:39 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id s24so11159714wmh.4
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 08:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nXMUgHcMZfyY9k+4nDgErnfgloDRhYJnVFo3LMXQlrM=;
        b=X0qu+bb+AZ63iT5aKeHoGKv9NcF7QkVA6HARCKvSiIcbEP7f+aJ4QNBZTArGpvAeBE
         Udabe07k6pdbiHsYnFgrzBGBlZE8kk0bzfHrrhiWSPitsDxQCid0Pj5048fJZXL9oimH
         iW9Oydyt6Il2XuXoFphwpHZs9jTVdNS6t5TdKO1jH9VuLJKpcnFBRp6xW1XjlDD7nX8X
         UDgDbUuT8vJSOoXHFypB6kWNhSdGTM+n4jEQldhFk1isgTigxEb+0U9OfrNMiOvf+aNo
         RON+dhY2LnKDSc7jXv19m2rkQfCL6HtOO9HJA0aSm/B+y+KrL75aDJ7yIj8UoiJUJINf
         l0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nXMUgHcMZfyY9k+4nDgErnfgloDRhYJnVFo3LMXQlrM=;
        b=7OXw4RE0m1tLuNx6awG6NBtd1a1+ypQM96OLTkffNayp7YMprueAYKBXG+TEPMJpnJ
         zUfBUcH+OvZfWA3JbMTM9LsurCSS07gsPihNT4YfVdGlk/iFey+C9vVc4e2NNBta5UY6
         ZeVKmZCZWD7z0DmdfQ5eTRg6ss3xREYbv+wHcVRg3iTJDTYiNY45S1GDEfQx5YnR49X3
         /dKyVZmoSKLkVaH91d5F0iOPn1zFi6VgHu8vn9QQyxUCiFaO/826H13HyAlvQzSdUvZL
         zLSi3p+rSfvZh4uc3LZzsProrxIZk7cX1qYnfUCVRu49lw0Ce77iP/1cHVkt3GeyG//1
         nDYA==
X-Gm-Message-State: AOAM532mzNx355yHEYGrzhrqvN4hn8qL0F1JpeDC2VJOMCe/IPdgKDjs
	Z9XfXOHeItyl6GKO4e5hvQs=
X-Google-Smtp-Source: ABdhPJxqdVAhv/j7paPSrXLqdSreKB07b7r9FWwvjzP4T6P6QsHdVl59G5171uG7gLycOYMM4b/68A==
X-Received: by 2002:a7b:c384:: with SMTP id s4mr20547419wmj.108.1632065857610;
        Sun, 19 Sep 2021 08:37:37 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id l15sm16614501wme.42.2021.09.19.08.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 08:37:37 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/6] staging: r8188eu: remove unused functions from rtw_ap.c
Date: Sun, 19 Sep 2021 17:36:53 +0200
Message-Id: <20210919153659.20826-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes all unused functions from rtw_ap.c.

Michael Straube (6):
  staging: r8188eu: remove ap_sta_info_defer_update()
  staging: r8188eu: remove rtw_acl_add_sta()
  staging: r8188eu: remove rtw_acl_remove_sta()
  staging: r8188eu: remove rtw_ap_inform_ch_switch()
  staging: r8188eu: remove rtw_check_beacon_data()
  staging: r8188eu: remove rtw_set_macaddr_acl()

 drivers/staging/r8188eu/core/rtw_ap.c    | 584 -----------------------
 drivers/staging/r8188eu/include/rtw_ap.h |   6 -
 2 files changed, 590 deletions(-)

-- 
2.33.0

