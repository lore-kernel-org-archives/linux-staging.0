Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAE772
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 05:15:18 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id em21-20020a17090b0155b029014e204a81e6so714309pjb.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 22:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=TrWrFryNSzPKJP5fTzUG9PfiRUJAobg9pZY4O3rR+fc=;
        b=acpu65aV+rMpf10pSGE9y4X0HC+bdtGZqcJ+hEUAk1WgUA5Bp5JSmQa9u6CvjNEZAF
         9o6g4dsncgcMCcbRJ/m/rVSnk8AMOqLy5G0KxeuQuLYyI5BS5BI9je24yggsn3V1Tx2g
         0kzW/8aZm4Y748iWMNGsNNu9H4oL4D96PiVDu7G6ZkQ5vUdgfFXfPgB/fJydOX8a3A/C
         KGiCgf2ZHnFP34u2bWNrMWtudBkqIezsYaUam2fveKquWx9YweNRPIFTI9913fuvyr4O
         7qkfkASoW48dYOu6oQbx5euWT552QYXo7mLkB53h8ElUrA+SiFZFfiYknXIpqc7+RGrz
         f/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=TrWrFryNSzPKJP5fTzUG9PfiRUJAobg9pZY4O3rR+fc=;
        b=oYd7sjEuDLIcpKbO2MmA8mmnRKb4ZerDLaZnpeeOA0SCJB95MxHnkc0iJerqLLXHwb
         Kr/LLhbps+s4JiXaKgR9Dg8GMxPixJ17ONnsSi9Q2XxkwcZ1aqLlbfLFeHXYrrdYaIhu
         lJzMi+Pq0zNtqn1C1Pzt6H86OZTRr4JwPzHv9RImtenyhO/KS2SgsQKNwntQ/v8jU/Ij
         NZJo+vQYByyFAQrQIr70VunyQOuFXHPcGz2n4Z6JqglR88phNzYy6mlrv9/C5HQMtr2M
         SJcfuOqgYai33/DvnvnCwLAOueqAb0S4aWJZwIu1gAog+DMTgvvvgfuYFEYqarE+vErf
         KUhg==
X-Gm-Message-State: AOAM532Edkeehk+llnDAyAjZtY7Tc3Lg7UWztO+Dq8IOiCFls3/REVzi
	9uWsR+Z4i3b9qMTHg/vxsd4=
X-Google-Smtp-Source: ABdhPJwO6ofb2zQAdrctcX8eqcNteWdixruCgaAs+5HjYGg89JzO0O4ffm9XHG3jpWWEGhDHo7eHUg==
X-Received: by 2002:a17:902:d64a:b029:e6:30a6:64e3 with SMTP id y10-20020a170902d64ab02900e630a664e3mr30785825plh.28.1618290918006;
        Mon, 12 Apr 2021 22:15:18 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id l35sm13144853pgm.10.2021.04.12.22.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 22:15:17 -0700 (PDT)
Date: Tue, 13 Apr 2021 10:45:11 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v2 0/4] staging: media: intel-ipu3: Cleanup patchset for
 style issues
Message-ID: <cover.1618289130.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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
  staging: media: intel-ipu3: reduce length of line
  staging: media: intel-ipu3: remove space before tabs

 .../staging/media/ipu3/include/intel-ipu3.h    | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
2.30.2

