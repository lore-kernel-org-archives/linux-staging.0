Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102426D1A
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 10:50:47 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id u9so15939079ljd.11
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 03:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=mxjXIZD5cMpbeMxIQK6zoS+Nrxtcej01ukleZy3/104=;
        b=TvtBUrGZBuveLyuwoK28cpmMHuYCafy7qyDVB25cPH9Gvw0KcfcRo5WpUjzIVbJY4F
         Fe5cdO3RYYai4zH9V8b0jQ6L6kHsnlMCw+c4RkcYXCQ8OCCV2oHjp1eGn7CfR6+xulnD
         Hze3xgSDb1EFdgjo/uW5OL7aUNeCahZ6N5E/26ke7rugC/8OwDQ2KIcS/IsXbAqdmXAb
         +04g4rdFrpuyvpZcjQSD563IXazFwATT+/ce4LUTkKHpkGCKygJROxKJCno8R9rsbP/q
         GdkH4/1Pnj+5QjNxnI3MTJ3/99fDwgCwNWD+8UrrMYaRnj2EiLnSQouSuNnny+hDcTPD
         IgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=mxjXIZD5cMpbeMxIQK6zoS+Nrxtcej01ukleZy3/104=;
        b=K2fFLgqBjQ7+1iI4PmiOamBFLmNgtKDrugY6x/HTBy6txYcVIoUEpXhu1fsKX9s9cm
         ljtZRxULRq0QGRm6gATmBpU15+8T99XETNMBhBiofDab4ddEwzRSRDTT2O3DVSv7xGWG
         3GXSCgDlpaZCqfrWSt3AzIEh+XQKR0NLYdYYl9OxVptqtKyGOjNzyvEkn+7yoLJkv3oM
         hs//jasTMa0vBsgh4cVGSLhZIZqTpAB6j0mryX8i596nIlknypepTJxi1eow2VnnfBQl
         Bg9OOaGzAa3EQc8YTqijZihoS9l9lRtA+BTUaEkvRNRzXv7Bh6KSBX4jIEaDNrBObRhn
         fHMw==
X-Gm-Message-State: AOAM530TWyLFQe6eRf6HtOSEUSr10QjSE7GPGZITNPqSAeJPVJNhR8Hd
	qCReWrMmKOwFuhl7e20aeWM=
X-Google-Smtp-Source: ABdhPJwszNqJHkd6Wwj9WSqADVZBIUNJnW8kWai5GT27u9jt9CG4Q9QvyIkdfwzK8NxWrH0LuNtiHw==
X-Received: by 2002:a2e:b0d4:: with SMTP id g20mr18916639ljl.127.1617706245366;
        Tue, 06 Apr 2021 03:50:45 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id m16sm2117307lfo.17.2021.04.06.03.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 03:50:44 -0700 (PDT)
Date: Tue, 6 Apr 2021 16:50:33 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH 0/2] staging: rtl8712: rewrite comparisons and remove blank
 lines
Message-ID: <cover.1617705825.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset replaces NULL comparisons with boolean negation and
removes extra blank lines after an open brace.

Zhansaya Bagdauletkyzy (2):
  staging: rtl8712: Rewrite NULL comparisons
  staging: rtl8712: Remove extra blank lines

 drivers/staging/rtl8712/rtl871x_io.h   |  1 -
 drivers/staging/rtl8712/rtl871x_mlme.h |  1 -
 drivers/staging/rtl8712/rtl871x_recv.h | 11 +++++------
 drivers/staging/rtl8712/sta_info.h     |  1 -
 4 files changed, 5 insertions(+), 9 deletions(-)

-- 
2.25.1

