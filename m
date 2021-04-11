Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FC971
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 09:55:13 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id b26so2080510pfr.3
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 02:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=7F1O+bCAJeRId7kUZbXaUrQs1QzWOIovw5IMYAIBgIw=;
        b=UZ+wMFzbIft4Q+ZPHh+UzuG7t5OLjaylBYvANNTU7gwLwVLA3oRYBuV0tOKBGacoxs
         6r4W+CUcReefrZ/pkkNuabslafThVW7DWR+g3XE4NSM/K8B0YOgSFqnSvWtPCSHlwKM/
         2q7AUthsPhAZOwp6jWHIGQ+wR+pjFWh3ebafGPcExTU8RzYn0PDkSZTCfvWvD/ZUZeo5
         gd+wGHtVpKsM3g0I6Yr+Krt13ZAT/j6FJYg0yq85qRx3SL4aU4Ydd1DhfzKm++CO1dFZ
         wpHE911647Q5rIdYYR9Oel3rpdqsMHaPwkI5i/sLl7bOZT2cqkacAshmG8Td+MczeMKn
         OotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=7F1O+bCAJeRId7kUZbXaUrQs1QzWOIovw5IMYAIBgIw=;
        b=XJBCBm//j2eof4/wdwZCQzlTlknRm34UPyHM2QkxJC9JP2hDIsqoHj9FipCRyBJS+i
         hfl+xbjJPu0tyz9eEe5ArpVc2R0qI9wmxgn0iux3KchZAJ0uBeyrb4jBZ1pWGk30d2ub
         08WwixLjfhum5vCBKbWxsxewpoAjZVJO1CWTUDdXmHSTL1L2unzVFCipxsjLIuzoog/X
         XqUsyuYXcBol8QoeFFw757Tv9ZGKYYaiHs8Z5P0gs3acUY3XC8hX/R0Sx4kHLXK7mNOH
         OlcRXugHCAsldL2oAdyyxfvChttihXofb1Pey+dh4DsVnRLbaiIX5kRru15oXM90BsqP
         +K2g==
X-Gm-Message-State: AOAM5307Iv5B6NDs4YloINBntHR3y+xhzVK7OCO9gxJ8INwEq6ETX3p6
	k5ypKWd/gnPTqeZkM+yfDV0=
X-Google-Smtp-Source: ABdhPJxXYmVx3abCfCXWnRfEd+xPH5PnTb5oIDEBoIwm29FEfbm5LXTD20t/2ogISJrjCoUiLKN7CQ==
X-Received: by 2002:a63:7e51:: with SMTP id o17mr21501048pgn.281.1618134912802;
        Sun, 11 Apr 2021 02:55:12 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id g3sm6734435pfi.31.2021.04.11.02.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 02:55:12 -0700 (PDT)
Date: Sun, 11 Apr 2021 15:25:05 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v3 0/3] Modify subject description and rectify spelling
 mistake.
Message-ID: <cover.1618133351.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes style issues
Changes from v2:-
[PATCH v2 1/3]:- Modified subject description.
[PATCH V2 2/3]:- No changes.
[PATCH v2 3/3]:- Rectified spelling mistake in subject description.

Changes from v1:- 
[PATCH 1/3]:- Removed unnecessary parentheses around boolean expression.
Changes has been made in v2.
[PATCH 2/3]:- No changes.
[PATCH 3/3]:- No changes.

Mitali Borkar (3):
  staging: rtl8192e: remove parentheses around boolean expression
  staging: rtl8192e: remove unnecessary ftrace-like logging
  staging: rtl8192e: remove unnecessary parentheses

 drivers/staging/rtl8192e/rtl819x_HTProc.c     |  18 ++-
 1 files changed, 7 insertions(+), 11 deletions(-)

-- 
2.30.2

