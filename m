Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7A571
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 19:27:56 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id r12so33153168ejr.5
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 12:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l3Dfg+t81O6iIBFRL3yKUv5Drx9glzGHFqa+e6m1HgM=;
        b=TymgCV05iTqKAdGAjC97+N/q4GoSVXD9mWjK5skpZ9Ge6BbpWqu2DXzQW9WE6/8cjq
         wU2UPbCkn5qKzQWpjLVCWSPqASNcrfE8z6DabgcvTz8bLUZkLgv5HrG+RMHig5A3LPOw
         QOqnHyEB7S+QA63x/mmarxWpDRn+Vtwe+2wsB7M+r83OMnlB9fjDY3sYagbJNJP1En9t
         NwAw9KNdeum0QixGZL1ah3EVdG1KryTeoGyldKiSW+httLClEAsk/9Dcqm9mWxhvL49D
         j3yNpJ/PCY2j5sSG4r5b0bNzTan7LIAqce3iKOa51qSEstbeX34x4I1hMM75gLGgOIFe
         YTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l3Dfg+t81O6iIBFRL3yKUv5Drx9glzGHFqa+e6m1HgM=;
        b=U+ZZXr5l4J5BiRrwHXvVylT04c55SfbVLwIh+FKSoc8/zzBpJgro2EB1ApOb6jSSX+
         Q6T/m9Qkia5hysNJushz6NDyky7KPhVdhSlXxGEDOeHUiO/DnvZU0qdZFanSi+GA1D8g
         XuVsw5HmdGUD9/ULyzNU9Yo8sT1H8i1ImqARAFQ9zGpRxfPK69/QKIgEAek44UvElz83
         Yv6I6No6/Zx3fwUnAZwIG1zs2zYyw8ZcnY2LjT90PiJm5X6NEO/SAkhXPs9Uryi1uein
         TDaKozR2uIxgqNVRiUpYp1g6zFqTUgE8YU63DPl4WvUjxmGBLr0PaRXZFLT2n7/CUxWq
         ZqbQ==
X-Gm-Message-State: AOAM531Z4hlJTSiK9+NXm78MIoKBn+9uLfZjrXsSssO2iWpcjGuyx6w1
	pKbR5gBoY3ChDZ6ZxNb6qy0=
X-Google-Smtp-Source: ABdhPJwm7LizrJVVwMgBW5UwqHZE3wKCjwCzoDBLYgdgpt984xNVzoEd0jiH9BOVBVdYp9WTzJ7VkA==
X-Received: by 2002:a17:906:6d01:: with SMTP id m1mr421426ejr.501.1618428475504;
        Wed, 14 Apr 2021 12:27:55 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id gn3sm259049ejc.2.2021.04.14.12.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 12:27:55 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v3 0/2] Remove led_blink_hdl and other related symbols
Date: Wed, 14 Apr 2021 21:27:48 +0200
Message-Id: <20210414192750.4974-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed useless led_blink_hdl() prototype and definition.
Removed struct LedBlink_param. Removed LedBlink entries in
rtw_cmd_callback[] and in wlancmds[]. Everything related to LedBlink is
not anymore needed. Removed extra blank lines in the two mentioned
arrays and changend the numbers set in comments for having them in line
with the shift. 

Fabio M. De Francesco (2):
  staging: rtl8723bs: Remove useless led_blink_hdl()
  staging: rtl8723bs: Remove everything related with LedBlink

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 27 +++++--------------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  9 -------
 drivers/staging/rtl8723bs/include/rtw_cmd.h   | 14 +++-------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  1 -
 4 files changed, 11 insertions(+), 40 deletions(-)

-- 
2.31.1

