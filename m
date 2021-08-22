Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D6E3FC0
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 11:34:36 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id d6so21510864edt.7
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 04:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wxxcsR6YhVp6QlvBQZDAEVDiQCmjY1fJATkGN2YtSRU=;
        b=Q5BQfaxNbeMZhwWwpTWEk94SLpXIKawtN4Ih6LJIgeMLIgVSBTZ+cFU+oG+T8gmnrG
         9DVyKDviKHmsIwQWWWEHjafFfzHpzQ3nS5c8ArcpYeiRLqxRUIkUkThjx1hjgN3fyTFA
         xZnHFkpzTDcpwGxWStX2YN9VkscyFLougOOXwYDecCL2vd45ROuYmu0CR6NSLqg+s2kj
         BKADV7g70uoqOmoJmBzRWrzC3TSaOrMfXrbo1q/9NVHyWhEe2j4+vKnigPBoutMGHWu+
         Wmy9G/kWZS3UNSir8sVf6DF9WythirjiCYHJCWpJgY0fp4kgS1x8LlRdeeahtoWOVaCG
         gHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wxxcsR6YhVp6QlvBQZDAEVDiQCmjY1fJATkGN2YtSRU=;
        b=nNcjbnCQ6UVO4mBUGCAHz8klHqi44g6TtDr5yfkZWNb0lb1TrC6aA3cBiUKDfHliTT
         DCVh8RGpB2xtx/CfVszHk2pyd3y4zMWWp7HItu3I0FgVpGdQ+EFYO5KuINPBnBoPtUHH
         gFQ+mIGOILRZxRtX84GUCnKyKFdLvGZzOOlH7/Bm/SUDcnQsAZh6Ybdw7WAuTadYaiy1
         nQDKvJcoaibeG3G1ZKGh/Ltn3pR1/2V/9AYnD8oDQAUCBWyBini292VcyjWZPgUCDFm4
         ai83nnMUqQOuqlbYPOAsTsi5nxBWb9fnjXKMjTKaKUdlGSIxwzzP6ccLbt+2LYHjeJ2Z
         bt8g==
X-Gm-Message-State: AOAM5325CCwmWg84WnfxFHeH5uU3Q0lAYZz4z5H9altNvySWssmQlgBg
	ed9hYO4PP42An1AAxe2zQqM=
X-Google-Smtp-Source: ABdhPJxsEZoUm121eYl7UGNCHdaeM7+k5bfj+wPTD839Uk7e/ChP9qKyKHE+r/h13DJvtNe7YhTZIA==
X-Received: by 2002:a05:6402:358d:: with SMTP id y13mr31992547edc.300.1629632074631;
        Sun, 22 Aug 2021 04:34:34 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id g10sm5610915ejj.44.2021.08.22.04.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 04:34:34 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, gregkh@linuxfoundation.org, straube.linux@gmail.com, Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH RFC 0/3] staging: r8188eu: avoid uninit value bugs
Date: Sun, 22 Aug 2021 13:34:32 +0200
Message-ID: <3651682.Tin1GtIqIz@localhost.localdomain>
In-Reply-To: <2327383.5TodInGmHT@localhost.localdomain>
References: <cover.1629479152.git.paskripkin@gmail.com> <ae27d6a0-dc00-459f-7b36-acf7f4c08d72@gmail.com> <2327383.5TodInGmHT@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Sunday, August 22, 2021 12:59:13 PM CEST Fabio M. De Francesco wrote:

> It's up to the callers of _rtw_usb*() to check return values and then act
> accordingly.

Typo.

Replace "_rtw_usb*()" with "_rtw_read*()".

My fault. Sorry :(

Fabio


