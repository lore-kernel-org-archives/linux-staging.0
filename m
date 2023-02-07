Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F5915A7
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 07:14:30 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id sa10so10359370ejc.9
        for <linux-staging@lists.linux.dev>; Mon, 06 Feb 2023 23:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8et7fqhXMZCX8yNZEl4XlBS2pBmshqKJu+GGm8vBsZg=;
        b=ARBY6eWrN4qlGRVPG5DZPKNtm1SuDQj4wvbFH7xYIkoNYWRTHHwNZ2SyUXvuew+4Bs
         dje1FdfVGW5l0BUTKihx4W20GmIWVxDZspr+DtFmjkR57t/xxrr2gUjHc36Lo48WG2ee
         5vuenodmgE2gemJe78UTVZWU3Q+1Iqgi/tlFIvx2Bxt2JQY7OGIeg85QdLATci00QBZf
         cZK+F0ZC/g+eXH7+JZcR1/ZHcgWsykYOfOTZhG78SsD+RYZlbA4f8EgO6zW0yq+lqwko
         s3mGfeDAX22PU5eOCO5neW66A5wPEwsXTr2pgStYzpRiSUH+WfL2Om95EDgh3rUl5QYj
         MwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8et7fqhXMZCX8yNZEl4XlBS2pBmshqKJu+GGm8vBsZg=;
        b=nxRzQPidBSJPImWHD5HMaMrDvlUlgTNMhXN2Yg9qIeB5WFo8BkzdkDYObMsXCKeSGi
         GXjCijwZ86hS1lIUPUXlNvb+NHPEvwiFYU45XwtIjfrqI7+3TRZWbgcKwyutlwjUnAws
         xWY4IJGhBAZ7WvE5HgdwpOa3UdH9+Eft8I+mYTHwKwpiuPIOuei3jTBZkv7+MupGDyYk
         bm7W451U5eU3lPfgWml+lsDCGtPACtXZWpUdGftYdTgP439gUm8jFuPhLbyJDkjo+7mB
         QRIiBQNcjKOAZa1LJtZk8iYwcciJWoDpejanek1I+RuGq5siwKFRm3VHBSeZlrhpt+e1
         py9A==
X-Gm-Message-State: AO0yUKU01qq4SFKfG3wQV8p9LTWZVx0Kx6PhTZl97EWsZNSR2wnJ0BxX
	UfrIfRKw7QgEjYzufMbl238=
X-Google-Smtp-Source: AK7set+KW6YImdMyiDc5jVPDsax4qe+JlnpIf6tRd7CTOJuc8gxu5yezriHBE0i0sApkEQo5PSzgqg==
X-Received: by 2002:a17:906:4748:b0:84d:47e3:fe49 with SMTP id j8-20020a170906474800b0084d47e3fe49mr2583042ejs.39.1675754068889;
        Mon, 06 Feb 2023 23:14:28 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id rh25-20020a17090720f900b00887830e535csm6435740ejb.159.2023.02.06.23.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 23:14:28 -0800 (PST)
Date: Tue, 7 Feb 2023 08:14:26 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] staging: vt6655: Macro with braces issue changed to
 inline function
Message-ID: <cover.1675753094.git.gurumeharrachaputi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
as '(iobase)' to avoid precedence issues" changed to inline function. In
relation to this, names of the callers of macro are also modified to call
this function.


Changes in v4:
	- Modified commit message to be clear

Changes in v3:
	1. Whitespace error from checkpatch fixed
	2. Should be applied together with changes in v2 for testing

Changes in v2:
	- Macros with one statement that is to call 'iowrite8' function changed
	to inline function as reviewed by gregkh@linuxfoundation.org.
	In relation to this, names of the callers of macro are also modified
	to call this function.


Guru Mehar Rachaputi (4):
  staging: vt6655: Add braces to macro parameter 'iobase'
  staging: vt6655: Macro with braces issue change to inline function
  staging: vt6655: Macro with braces issue change to inline function
  staging: vt6655: Macro with braces issue changed to inline function

 drivers/staging/vt6655/card.c        |  4 ++--
 drivers/staging/vt6655/channel.c     |  4 ++--
 drivers/staging/vt6655/device_main.c | 12 ++++++------
 drivers/staging/vt6655/mac.c         |  8 ++++----
 drivers/staging/vt6655/mac.h         | 12 +++++++++---
 5 files changed, 23 insertions(+), 17 deletions(-)

-- 
2.34.1


-- 
Thanks & Regards,
Guru
