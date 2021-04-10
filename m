Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289A471
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 15:33:42 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id i4so4388275pjk.1
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 08:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=XxbeESAJRhZnLZL/LShXrgElrZZDQU9QHhNsuZ6s6Ik=;
        b=tXh6Q4aytgrygIrjNGZj0h5zOlcXpbs4KPr2IxheULO9GDh6+D5Jgvx37BGF0g57Pa
         2hSj/pJGRm0wZSUvsfH/vL8x58EoDateIOFacLZ8LGESvi8cSDJG0JCL0bxhA1JsXtz5
         ENYIEzEE+kz7J5qjANJBGl3yjAPXScAaQloWXYXtRCL8E7mjVwO320YAL0bWXsry1SSC
         lYMeFOYDZ3IJGlCLrg6xVFYHHdMap139u7RmKnfhE+n+VDbhNSYuY6nCI6+cwjXYbJaK
         pOMakMrcz2i7vHTddOwaY3gHzs1GA+WoJVX1Lx90zMneQREzh0+b2JQc5uv3+kdHf9bk
         tNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=XxbeESAJRhZnLZL/LShXrgElrZZDQU9QHhNsuZ6s6Ik=;
        b=m/j0LoyaTr/E4HRjvAH5Ajtpf5SZTW54xazVeqAohiUlwdLEfi72jt+oRuMimpLzRA
         qPs9fE1WGUso975SFAdlyWGUUMIgTg6RTtWyHFiVCQrYFXLWqQZadrR7K0GWFoNeMIGs
         /77rAnBNzQonfwZtCdHeYMM7IjsqoHft8vdELtROEI8tAf/WUtm2SWS6LeoBzk5Ey8Av
         spIODTL3lEBPaugG3nlLub5PWxmlcZ4cA6+3wUxmr9HvZTuhEHQtUNiNQuYaCuxhCujK
         VIEI+8eeNIgqoc4QhH3+Ryt78kErveJXAf7W7R+TJ0/Q42byjY9uKScf/WXPAibhuvn6
         y1hw==
X-Gm-Message-State: AOAM530cMuQetmeIVgRru48I4x7vIy85GqAt7yhnY6QhPyycwChHIEm4
	cqBErCniXKfoVJOnyHIyjkI=
X-Google-Smtp-Source: ABdhPJzz2VYihh/wWH9Rb1ffCv0kE564F79OmYPIE9tlIcTjWZ8VR4q2DflBFpeQbzxt+2dM20Ufjw==
X-Received: by 2002:a17:90a:8813:: with SMTP id s19mr19004148pjn.94.1618068821687;
        Sat, 10 Apr 2021 08:33:41 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id c16sm5032245pfc.112.2021.04.10.08.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 08:33:41 -0700 (PDT)
Date: Sat, 10 Apr 2021 21:03:33 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v3 0/2] staging: media: zoran: aligned the code.
Message-ID: <cover.1618066787.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fix the alignment of code in proper manner

Changes from v2:- Aligned the code using tabs.
Changes from v1:- Aligned the code using tabs and readjusted the
comments line.

Mitali Borkar (2):
  media: zoran: add spaces around '<<'
  staging: media: zoran: align code appropriately

 drivers/staging/media/zoran/zr36057.h | 108 +++++++++++++-------------
 1 file changed, 54 insertions(+), 54 deletions(-)

-- 
2.30.2

