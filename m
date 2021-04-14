Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CA572
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 07:21:46 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id l76so13768394pga.6
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 00:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=5M6lZDHmRsVmI9+ZaAWTX2wcWhrGZNQhEEI4YOQh3oU=;
        b=ChZh3Dl2or1rhHPDot1lrzwIiiA6KRu5T1fe5TnRdZP5sdWQ14awGLuWyEw5GtNYm4
         V38HkjKYWV5ciOTEdLjKikOttbjRK6dxcOeh2IrCdhAqqdFee2wFDXKSl9ALq41aY+2I
         EqCkqrrx9GR6A2hy0LWanqayxplsLvtQ7ZIeqt+dvzthLBdXqAFeiOXoOwSWiWpCga4B
         4ywq953KplFvQnvTey7m3Gx5ztx5H10uGjZ+VBo4Xh5vO8iVBrDErqo2KQeLQtnrof+u
         eqCeRFAKm16/9rBSd43uMkTrJIliNYPkjKb3zL7BkZadoJPAD1sZc4q3WV+2zmuxYHhR
         a+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=5M6lZDHmRsVmI9+ZaAWTX2wcWhrGZNQhEEI4YOQh3oU=;
        b=q1E5iMVk+gRVXpzT3iMOM4g8HmVxobG3OnykmJanst6snpuWdIHFbz7ul2zTaLTFt+
         KaOgb2Vxt8QWuZJ06XtdsBPuzS49WDGfg4kTrlq4f865xLU9IWoS8MaUk1uxclc0bYwI
         5Q6drUXtlozcY2WammtoymmUXBina55wukajhT/p2TezwZ374B3cR/OE2pCvSXTt9Kjz
         XREp9bJZd/HFfmsB4dHbVU4WtN8ikirk4E+U8fWGrVHiEQKVMp1+63/yZszQk4rYXSQa
         8Yn7vOd3vWe+vFiHRiRe1/+BaHQFuftJPPdWNwNWzb+o2pIDe9rFp97LY2kCwJt7/xrl
         q5jg==
X-Gm-Message-State: AOAM533ywN0u/GqyX8Jcl730qOz+hnOEWKURymMka4tyx0e22G4ruCFI
	7qREkH2ek2hDNFirzt4p4G0=
X-Google-Smtp-Source: ABdhPJxMkFmo2SO2Tj4yN8plu5ZWoTd/3WUhDlACHik/MxUw4iQ8KvISpyA9PKdHD6F1FUkGmR6W5w==
X-Received: by 2002:a63:c4f:: with SMTP id 15mr35326894pgm.379.1618384905996;
        Wed, 14 Apr 2021 00:21:45 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id c2sm13931755pfo.53.2021.04.14.00.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 00:21:45 -0700 (PDT)
Date: Wed, 14 Apr 2021 12:51:35 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v6 0/2] staging: rtl8192e: Clean up patchset for style issues
 in rtl819x_HTProc.c
Message-ID: <cover.1618383684.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Changes from v5:- Rebased these patches and dropped 2/3 and made this
a patchset of 2.
[PATCH v5 1/2]:- No changes.
[PATCH V5 2/2]:- No changes.

Changes from v4:-
[PATCH v4 1/2]:- No changes.
[PATCH V4 2/2]:- Removed casts and parentheses.

Changes from v3:- Changed subject line to match prefix on the patches.
[PATCH v3 1/2]:- No changes.
[PATCH V3 2/2]:- No changes.

Changes from v2:-
[PATCH v2 1/2]:- Modified subject description. Changes has been made in
v3.
[PATCH v2 2/2]:- Rectified spelling mistake in subject description.
Changes has been made in v3.

Changes from v1:-
[PATCH 1/2]:- Removed unnecessary parentheses around boolean expression.
Changes has been made in v2.
[PATCH 2/2]:- No changes.

Mitali Borkar (2):
  staging: rtl8192e: remove parentheses around boolean expression
  staging: rtl8192e: remove casts and parentheses

 drivers/staging/rtl8192e/rtl819x_HTProc.c     | 14 +--
 1 file changed, 5 insertions(+), 9 deletions(-)

-- 
2.30.2

