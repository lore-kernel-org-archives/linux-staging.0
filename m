Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5545F70
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 15:28:27 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id i190so11636584pfc.12
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=txv1fgolWcizMYehBcvnnggRxVWanXigizl1Xf+Dky8=;
        b=MWezdm9avdfWuu/HZ27c6zuKllOS6Pl1/9SXUAcMD4YEPcyYZOPuEoJb5wsCLXOggi
         EykZ1z/CAiQTJ9FtPqD/3I6yYyf1VGMGl7lZN9U2zR9S13tV2piPddKNQa5SmOCL3VJx
         XppanDypKGNPDoZyommH1o2N6z32RC3GfWMkxA7cAsaAXw/z/S/xinlxDFDfhw977Cmm
         P/9mdU4A2MhkBgmByF4DwiNfKF2LnVJiHPNynXwTUVxVuXK0Wr+rPg0bgLEdwA+kAJGK
         NDAuXjtOfNNVyY6NP5rZ8TyXG5Uq2iVUk+jdL00LQvIfLzWQ4+fRyEws/Af2C5EXOp0l
         /5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=txv1fgolWcizMYehBcvnnggRxVWanXigizl1Xf+Dky8=;
        b=IeRSYUmhsBtMFki1dYIN+LLFkzeLdclu0Z0f2wPCrzEdNqCjsOTfcyPUYbw5HaeO9+
         3nPKD6Mym5WjF+qKVfhJMZ8c4/RUphy84uXBUIvDWME2Ywfepyb/+fLDKHzpzcXV9dnF
         8/KoAa+ncXc/WZl+5HPaVYxnLCCzzzMnlTIDC7ek3ildADOeu9hJejVh2S29nEA73ooK
         /YeRQf0u1RSrO9r8kdJyPtPaeLwxRloaF0cX6icsd9G2gI0s/y40vx7U7P36BZYvNTct
         QIyKuyXtmPmMxFrgKkRJyJDZI43IzQNOuCtNX4T06AYnuhM7YZ8zlHIQTGnm6VQR0USp
         L4Wg==
X-Gm-Message-State: AOAM531uNOzFDMID1geYNLQcp66pU8m9AoVLJm6hJlzL0zfNamjn9qUT
	8Wjo1BolfyjpHA8MzWqdmbA=
X-Google-Smtp-Source: ABdhPJx2TJvmWt+Ug1whmzVfYhptY4K5aGt4mzyisLIAcUDt4GI6t1GQwNRJ2GAjc0ufcedIkPh8XA==
X-Received: by 2002:a63:d58:: with SMTP id 24mr32958444pgn.171.1618327706735;
        Tue, 13 Apr 2021 08:28:26 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id w75sm13360149pfc.135.2021.04.13.08.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:28:26 -0700 (PDT)
Date: Tue, 13 Apr 2021 20:58:19 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v3 0/4] staging: media: intel-ipu3: Cleanup patchset for
 style issues
Message-ID: <cover.1618326535.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Changes from v2:- Rebased these four patces and made changes against
mailine code

Changes from v1:-
Dropped patches 1/6 and 2/6 and compiled this as a patchset of 4
patches.
[PATCH 1/4]:- No changes.
[PATCH 2/4]:- No changes.
[PATCH 3/4]:- Reduced length of a line under 80 characters. This was
patch 5/6 previously.
[PATCH 4/4]:- No changes.

Mitali Borkar (4):
  staging: media: intel-ipu3: remove unnecessary blank line
  staging: media: intel-ipu3: reduce length of line
  staging: media: intel-ipu3: line should not end with '['
  staging: media: intel-ipu3: remove space before tabs

 drivers/staging/media/ipu3/include/intel-ipu3.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

-- 
2.30.2

