Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE77A929
	for <linux-staging@lists.linux.dev>; Fri,  4 Aug 2023 13:46:04 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fe4a89e7efso4117615e9.3
        for <linux-staging@lists.linux.dev>; Fri, 04 Aug 2023 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691156763; x=1691761563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xWuu2OnLKmbYmSWSzEw/OZwUtFt5TnMq9XjoBkxbtSU=;
        b=AdNRPW8NVlSEdiGvGG4AzCR4ZwB/6Sr/SWoQ4LVb1SvUJGjrLF86H5+k6QMcgb6wbO
         NuqqhukaO6/isA6KMbFL4XRc+UZtXIzS+EsMnzd4c7+2lcc9g627+PgBESdqwGvvcIaN
         DH+7FO4D5v7AAB7i8ivbYMF9boB5co9WeXmY1QOMsTS/w5MfI9ddIBpvqdZPJUxvRVxF
         2Uz4phSg4X6F5Sq7zcELLN82nLLwxZUD8OPwz6KWRSCrlpDnKuD9AtZBdvwGo9beIhXI
         OTA2sXn5nzq38njmBscc5SnKqjTEUsx18zXmMPK65glSkjgvTSng00YxyVVnnOI29bY1
         TvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691156763; x=1691761563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWuu2OnLKmbYmSWSzEw/OZwUtFt5TnMq9XjoBkxbtSU=;
        b=VsjEbXr2tutcHMF8HsXX17m1PJV2g2oKCb9tm+QsUwyTXTAqxC7MnUaqnx1CewvJz+
         hgSO8oUnefC8NTXZZbkc4ZXjDMBEeoRD89FAf3aGWNuGKewmGVxea88h+uTTV97+Xv7o
         VxYVRn1pVzjRnqxN6+0yLzeAoyiva38nopgvH2c8P03VnDWA2rEWj1LwBSZX9w+78+5H
         fXsvvZWEDW7jFxL5yymfJ6z2MPHbnJVGYZSPbC94DzbCOGLSbGkF1qTqMWhVyKVYjEng
         bl3S9gTYlT/XoavojuV+g6z7r962UGCheyBBoNi9hVU2YfdsYh32EvgfU6zjdff2cC1i
         MjSw==
X-Gm-Message-State: AOJu0Yy7DO0LJHX+aOhkL47BgUKYcGoe0W4CVazxsIKyfbz3mjtM18SO
	AGX4cW9HdAjpr5eAfKrhgbc8ag==
X-Google-Smtp-Source: AGHT+IEurdBJVw10nT5g8eJSHrfsPFgwk2PgPdluZkwQK2tvT4oKT1F6OL+j6HTggPdKhhBIcIfutA==
X-Received: by 2002:adf:de0f:0:b0:317:61d8:3c83 with SMTP id b15-20020adfde0f000000b0031761d83c83mr1324718wrm.3.1691156763151;
        Fri, 04 Aug 2023 06:46:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p8-20020adff208000000b003176a4394d7sm2587093wro.24.2023.08.04.06.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 06:46:02 -0700 (PDT)
Date: Fri, 4 Aug 2023 16:46:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: gregkh@linuxfoundation.org, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: vme_user: fix check alignment should match
 open parenthesis
Message-ID: <7159231c-9e87-4a3b-bc0d-a6ade6c04c65@kadam.mountain>
References: <ZMkwA8TnMBAgPRgR@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMkwA8TnMBAgPRgR@alolivei-thinkpadt480s.gru.csb>

On Tue, Aug 01, 2023 at 01:17:07PM -0300, Alexon Oliveira wrote:
> First patch was intended to fix all "CHECK: Alignment should match open parenthesis",
> but added new warnings in the process. This patch is intended to fixed them all,
> on lines 133, 142, 144, 145 and 173.
> 

Since you're going to be re-writing the commit message anyway, please
leave off the line numbers.  Line numbers are not really useful.  Just
say:

    Fix the checkpatch warnings which complain about "CHECK: Alignment
    should match open parenthesis".

regards,
dan carpenter

