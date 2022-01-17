Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810C029CA
	for <linux-staging@lists.linux.dev>; Mon, 17 Jan 2022 05:58:55 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id h23so9931620pgk.11
        for <linux-staging@lists.linux.dev>; Sun, 16 Jan 2022 21:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=+OBBsWDlhHLqnvCwRRiFZ+kgpQAOYsMJlg/fYwGhI+A=;
        b=AhVrOz/zMHPRSceQ/7C7EmSf4BOTcYgUFUEVfVkIYbXmgzB6HJBZtFG4V2g+5M91qK
         tUpAGRE/AKRps0QSHTWghNsIp+FfAYtc+AoeP0B6mBi22KI7VTfMOshS8SFr86GQvMf8
         y/9wWzTbruPGxuA3fhQ8/6eyjiGjYWKfHsbyOer+TgahTAlHm+8DlK1N8OJw9YvRee7L
         yf2yXeRD/hN/JTA54C1HYjtpM3eC7OPtRW7Qf2fNIgU5kHYs5uVxXgXq7B6WZzsnKWd4
         GKqcZoSKfJRbaOBZWsKpljqc/kk6GaelQvPB7YCr4cDA/Lr6ZSoDk5Y2wGJ6Wvn7HxkZ
         lpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=+OBBsWDlhHLqnvCwRRiFZ+kgpQAOYsMJlg/fYwGhI+A=;
        b=Nl2hhH3ClmyI/qSp1yVS3OLO9W0LFuRvFwNvMINwepJ6kZyPBfw3SaenUvTxnDg8yP
         9qQTBXyiUvQl7orSPpU/CNnmi1ldpaFnMCu52QnfCYXfX09iRaSAocACGac/RhuQvi59
         Ldw+HgX0P8mbFof821S+ID8Zt7UpDT9dW/JoAaKeNW6cvK5gKQV6sQjIXJGLw2Oq2mUJ
         WJN9fjNbESGAGNBOn4ezzR7ipZQX+JlUakBh0oOBpWVk7Aw4xc0AXHMBQ+61aPd2yo+A
         2hMgVfMEkppxAdoKDgDs8xNUwuvLoH6Dy47gDpPoyJGGWhl5mO3bZPbHzN8hpZjHghw6
         kP1Q==
X-Gm-Message-State: AOAM530xF5bsVq9qdL0fNZdQp1tD9tYWglRo2+NhWcBXM5r0avYFr+EO
	np1lD2oEBMgJ8QA9jIqmntY=
X-Google-Smtp-Source: ABdhPJzqFNY3H7KKvdqvwAid4nu+1+Xj7Y/ZyGxk8d0MRItpsUiiGoWB0lQKM3mHMIpZXYQi0DYiDA==
X-Received: by 2002:a63:6806:: with SMTP id d6mr17821958pgc.353.1642399134999;
        Sun, 16 Jan 2022 21:58:54 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id n22sm8754464pfu.160.2022.01.16.21.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jan 2022 21:58:54 -0800 (PST)
Date: Mon, 17 Jan 2022 18:58:49 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] staging: pi433: validate min/max bit rate settings
Message-ID: <20220117055849.GA10644@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202201162116.8r1xEw9q-lkp@intel.com>

RF69 chip supports different bit rate settings depending on which frequency
modulation is used. Failing to correctly validate bit rate can lead to a 
silent failure and cause packets not to be read/sent.

This series change the order in which the rf69 chip is configured and add
max bit rate validation.

Patch dependency:

This series depend on these patches as they change the same set of files:

- https://lore.kernel.org/lkml/20220108212728.GA7784@mail.google.com/
- https://lore.kernel.org/lkml/20220114221643.GA7843@mail.google.com/

Changelog:

v2: change bitrate variable type to u32 as pointed by kernel test bot
v1: https://lore.kernel.org/lkml/20220116001726.GA22699@mail.google.com/

Paulo Miguel Almeida (3):
  staging: pi433: fix validation for min bit rate supported by the
    device
  staging: pi433: change order in which driver config the rf69 chip
  staging: pi433: validate max bit_rate based on modulation used

 drivers/staging/pi433/pi433_if.c |  8 ++++----
 drivers/staging/pi433/rf69.c     | 16 ++++++++++++----
 drivers/staging/pi433/rf69.h     |  2 +-
 3 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.25.4

