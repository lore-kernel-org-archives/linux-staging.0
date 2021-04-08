Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3252670
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 20:38:23 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id l123so2703174pfl.8
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 13:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=zk2h9OUEkeXCZ1HjAVgUvuKrSyf0eKRwZjnK1zVYlOY=;
        b=j9vp1INpqRgcAVyQuSBKK92aYEkDbB18yrDakdH+SoIGf5sTjgfXICPQ8B9BekXBhm
         BQB9SpejECNfJc1VGUgJzCc38zZ0PKk7qp14uaYYyVlowycmVC3SznXbFcwcBogGH4Dm
         K6w6hGLCUBdaByPgPgMEPC9xPsGwPSb0QXIuCwGbajlTJ6chjAIx2ZxKcHXRJFC/lqNl
         6n56dwNQ2DSm0Fcbp0OcDJr4E/zDc1MTAJuifaitmJKtOIAMgDFpB81qc3TXiM08m6OW
         +xWY2BDew3vayMWVNyLWuY0ruJo4ikKgdqDfYTkQhz5uc4smWaPlcH3V+QPt3II6O7f0
         CiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=zk2h9OUEkeXCZ1HjAVgUvuKrSyf0eKRwZjnK1zVYlOY=;
        b=G+e561grvW/e3dal42jYYglfu1mKyBNjZxqoW5T6CbsR11yaufK7ZBvF7bYF6sdfht
         m1e50tziY11OF/CI0OBT4290CdfejHX/S/tuFf4aU/1BXj28zi614i4JeD4/AsFNDS7d
         iP9l4cKm/WnH0H6RcbD2W+jyclTXf4eQfyj27M6MhpJJ5QwsKRdS3OqlwrwxzwirlhvP
         kGhJshK+JEUgnS22HRUmu2kdyffgqn9E2JYOzXDc6HjqdFaCIMfowwkKoQjgxzlVo8C2
         2v4/5VCmqgeDkWkErvXYeATvrD58XUySKJZkPEiYq3shFB3Ab619C/txxC/6hvQePS5K
         6+Gg==
X-Gm-Message-State: AOAM531zZL2+kqQg1j9rewoDfTIgOEf8WIdldsmDiPvnani14XHrSz7/
	9hZKsnQ5JfN3FfarY0KjpJo=
X-Google-Smtp-Source: ABdhPJyZgsymT634l5QOHhmDLjr6UpV0Ear1AXUybJKL/yRxTyDCO7ppsi4gXPHj4ivqPT60g/QeZw==
X-Received: by 2002:a63:3189:: with SMTP id x131mr9652577pgx.430.1617914302551;
        Thu, 08 Apr 2021 13:38:22 -0700 (PDT)
Received: from kali ([152.57.11.236])
        by smtp.gmail.com with ESMTPSA id y17sm316669pfl.10.2021.04.08.13.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 13:38:22 -0700 (PDT)
Date: Fri, 9 Apr 2021 02:08:14 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH 0/2] media: zoran: clean up style issues
Message-ID: <cover.1617912177.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These patches make changes to clean up style issues
as identified by checkpatch

Mitali Borkar (2):
  media: zoran: add spaces around '<<'
  media: zoran: replace bit shifts by BIT() macro

 drivers/staging/media/zoran/zr36057.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

-- 
2.30.2

