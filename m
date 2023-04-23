Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0ACB20E1
	for <linux-staging@lists.linux.dev>; Sun, 23 Apr 2023 14:22:07 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-51452556acdso2708492a12.2
        for <linux-staging@lists.linux.dev>; Sun, 23 Apr 2023 07:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682259727; x=1684851727;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mVt7yDbi/0+T9A3kskBIqFMz5JWCsfF4sEoLpMEoXSs=;
        b=gZeRNCEboFtFuzswRDftVtw5ef6noYVrDAGPpESkhflCUZOvCQ67A/ZnG00pPh9w/h
         hHPyJyKBnzwFTSmK4Rcbsj5tKGudkYoq3cg4RXZ/a5ApjmhuM6vaoV2jbO9mNPkEcmX/
         KKGX1x+ol2BZRH+nAMsFrocqHw7ArIZMJDjQboPTkMvfaX128ThcQWa+3kA+4GBFRnlW
         jz95jh73NVmasYVkE1nEm8ubnPV3LKe9E0lg210IWfMeG9w5bFtDzOuZcCZX1n6dVyhD
         rQAPw/eDYMPBvbLe4L/FXcJ53XLs4zmreonjyXe7N7e7qTiRiDobq+ZR1ZmNqVO84tkF
         n/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682259727; x=1684851727;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mVt7yDbi/0+T9A3kskBIqFMz5JWCsfF4sEoLpMEoXSs=;
        b=c+c47KsNUWar/LsTgSvdt6s53Igo/XPe+QKK+VwiB+Rj1Zkuaqxp3noTOGHkRRIe7W
         ayr3U3VpDnznsO3VolS7BiNWKyhyHEOf78umLx1H6rqicFZoWNZSwad0rQP1coOFKZUU
         GTxFimM5azCOrYX3+1Zm7ILj2mj7ujBhYfwwa+7NYSenidJ3JD9mD9kAnu7KnVO/H4aL
         Df/tkK+cVljYm+gBt24AuDObFJbuoUw0xfh/ORU4aXgmR+IKVsBjQWVURNWX8FI1Z87Q
         3fhIOe2pAOO4zka1N0FpUYRWnfkkVJEfCHFZidlvyAyFJjwx9Uze7uemSin68rPja9yh
         aWag==
X-Gm-Message-State: AAQBX9c3yIuWtEnq9rOi+SkDGliomiXnqhmJBDyOAV/l2ajfJNN51KdZ
	/yzRgOwglbVoO32DU1Lc1K4=
X-Google-Smtp-Source: AKy350ZL6PsANWh7JqFcxX+XhAOLY9xBXDIz+XG6HwbghAwtgd0H1ZXYmW8NIIz2+O5syNTA2Vny9g==
X-Received: by 2002:a17:90b:4acc:b0:24b:8b39:cd7f with SMTP id mh12-20020a17090b4acc00b0024b8b39cd7fmr5213575pjb.41.1682259727343;
        Sun, 23 Apr 2023 07:22:07 -0700 (PDT)
Received: from pop-os.localdomain ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id f3-20020a17090a9b0300b0024b960de793sm1716290pjp.40.2023.04.23.07.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Apr 2023 07:22:07 -0700 (PDT)
Date: Sun, 23 Apr 2023 19:52:02 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] Remove unused rf_set_sens variable
Message-ID: <cover.1682257566.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The rf_set_sens variable is declared but never set, so it is always NULL.
Cleanup the unused rf_set_sens variable. Remove functions
_rtl92e_wx_get_sens and _rtl92e_wx_set_sens which always returned 
error code after removal of rf_set_sens variable. 
Cleanup unused max_sens and sens variable.
The patches are required to be applied in sequence.

Changes in v4:
    1. Split changes into patch series per feedback from
       gregkh@linuxfoundation.org

Changes in v3:
    1. Fixed description to fit within 75 chars
    2. Added suggested tags
    per feedback from philipp.g.hortmann@gmail.com

Changes in v2:
    1. Removed function definition rf_set_sens
    2. Removed usage of variable priv->rf_set_sens
    3. Removed functions _rtl92e_wx_get_sens and _rtl92e_wx_set_sens
    4. Cleaned up the variables sens and max_sens used in these functions

Changes in v1:
    1. Fix comparison to NULL of variable rf_set_sens

Yogesh Hegde (4):
  staging: rtl8192e: Remove unused rf_set_sens variable
  staging: rtl8192e: Remove unused _rtl92e_wx_get_sens function
  staging: rtl8192e: Remove unused _rtl92e_wx_set_sens function
  staging: rtl8192e: Remove unused sens and max_sens from r8192_priv
    struct

 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  3 --
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 45 --------------------
 2 files changed, 48 deletions(-)

-- 
2.34.1

