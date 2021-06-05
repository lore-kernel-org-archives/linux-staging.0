Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886F517F
	for <linux-staging@lists.linux.dev>; Sat,  5 Jun 2021 02:09:02 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id b9so17213115ejc.13
        for <linux-staging@lists.linux.dev>; Fri, 04 Jun 2021 19:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ae8aO+EcXpY+/Z6vk9bck8nM2UH/1bl+PzXd6sCUhb8=;
        b=eh8hMZC0XKYFIDWYBcJaE6kEw2ULmpOJ/a3PoxdAr62Hu3vqx3+x/OaoNrX9+1xMPY
         zCC/tLKzgbpX+AA/vy/XMzR6dzOOHfXkWNYVbwH6XrUMshnX9BR8O2FCa8uihDN8oKzm
         VC9lnvcAf1Mbn1nTTfe7If1r1NNpP9hWW/rWIpZH5tKRaPuWAir8cbe5tNKPCtQdCdoH
         Gj2piHRg5KqbSNdWBpLKkf8Yj/havUSlOK13MOVpzgnMEP0MU4ivqgnWLrSgSZyhmPRL
         inwNOJ7QO0ZvnjZqvZDFv6U0VnW14wz+D/cKim2K6qWiEbxqsf2A85Fs/RjzrdY/A1eF
         5YdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ae8aO+EcXpY+/Z6vk9bck8nM2UH/1bl+PzXd6sCUhb8=;
        b=hKIjrOCKFUVshQyv+Dzs9kIN6s2fKq+jeTeCEVHHgPthc/4/ffh28+mjacQkpTmVr/
         VJed6kN4lC0Lrbvy4lbZvvm5EHMDsyeCHgBtEwoNrYrZt3xheTYWDml0J/aLCbjWGV4t
         vZe34eBgGSJ3yN/jcuDjptK5J+E1nRU2WmLxvJLJyaoXPIQzSC4gIRTQKcTLin4MjlmS
         V0CE3HTIoWo4EQ81c5gJFyfzN7m8T0MoOLgicLOWQw5OgB4HWqDSCq19JNpXXE7ynSow
         Y8R47Na6o1HwABpS7820IoF5QYqf2dauDVRPJ9vg7HYeSZiQpn93netW0TH75hb14JFx
         OEUw==
X-Gm-Message-State: AOAM530XpySyF7SvJ3vP2u2w0biy8G0l+gYUPAsFzz0mgMt+ALT/lpPd
	7ZKQCNDwDEWXH1+n7VhvYqI=
X-Google-Smtp-Source: ABdhPJw0lyNr1u+lwMQPhKdENwjyWfuoxWWQmqVIfOrrTMlkHr2cQ3WLDO1DLc1q9sJt59LXfVZjUw==
X-Received: by 2002:a17:907:b14:: with SMTP id h20mr6996353ejl.257.1622858940994;
        Fri, 04 Jun 2021 19:09:00 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id gz5sm3496232ejb.113.2021.06.04.19.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 19:09:00 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 0/2] Remove unnecessary tests and cast before kfree/kvfree
Date: Sat,  5 Jun 2021 04:08:53 +0200
Message-Id: <20210605020855.1065-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(1/2) Removed unnecessary test of pointers != NULL before passing them to
kfree() and kvfree(). 
(2/2) Removed an unncecessary (void *) cast for an argument passed to kfree().

v1 -> v2: Added patch 2/2.

Fabio M. De Francesco (2):
  staging: media: atomisp: pci: Remove checks before kfree/kvfree
  staging: media: atomisp: pci: Remove unnecessary (void *) cast

 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.31.1

