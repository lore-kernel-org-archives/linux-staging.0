Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EBB1386
	for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 12:25:17 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id m125-20020a1ca383000000b0039c63fe5f64so8855494wme.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 05:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C8CokK5l88E+K1ZVN1mOI0JmAiwVZ2MGJj9DeLyRN9Q=;
        b=WdTHWZCobcprTtM8e5zjuxErzsh3ns/2th69gwXU9lWQTkx4lCY9Gzm1lpKJ6mXb5L
         hTk/TQd9dHEtrYHLAjYMdu0K9gUEixGLJfgvD1IwTXxEmzwUmdOt5Wp+bgbYmXHuC+mc
         d65955UpBZoPvRn0iocKNujXwLJIpKWCVUbYKTFTpCLPAQL4+X79Kn+FiIbI6uEHPPx1
         uPOa01YVp+qaSoLI/7umwATugMwLd2+zROZ/z9XxlAAO5xFcYfOICgwBxBFTMTKXZRP0
         SE8jMLE04vC7uSd9jWn9WaTtUgkXLvXWy5n4PYBxIg1+pvTKg9NUCcEWE4QSo8k2x04K
         ZTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C8CokK5l88E+K1ZVN1mOI0JmAiwVZ2MGJj9DeLyRN9Q=;
        b=0pCKC7UhGFDiwByeLY0BjQiN6CFimBXrtdCSTBVe/AUdR2WDi2xATIGYh7ekf2ZfJH
         9498wSKthAbHeZ804FzBNYmHgFUZD/TxwPX3l5ECmGvOKY5XE8ggLKBdkFK/108O9NS8
         L70qdCg3kf2twvEAOaSNMjQdH0ZTv5r2j9v8OJtntkXLm7Qt3Z65FFQmk1/z5i7GREI+
         nJmgev7flkjpmz6Jo9TSfAB23yS2peQQdyl+H+JY5vv9oKrLO16miOPkZrSBBpjsaogr
         tog9d+OH/QxaAJdLgFq4L9Vx4GGYJ2U5w5I8a+xJu8B9+HOuU9qo4Ei2dUZXJQuZgVJl
         Ta/Q==
X-Gm-Message-State: AJIora+2roJMeR/cwqA+p2Tr0RPp+SGbyjv5c67942Za/HDP9AHWq8wg
	rJ0zU/44vRAV+Zxji8yhLVyhEw==
X-Google-Smtp-Source: AGRyM1tluAHsky0HEv3bnsaxQ+bWaDhEdRneV3jeo/uwH9Su/9c66OHyJgWDTlsWJU8PclJWcAaH7g==
X-Received: by 2002:a05:600c:1f0c:b0:39c:600e:6d51 with SMTP id bd12-20020a05600c1f0c00b0039c600e6d51mr3593051wmb.3.1655900715834;
        Wed, 22 Jun 2022 05:25:15 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id t22-20020a05600c41d600b0039db7f1a3f5sm21011234wmh.45.2022.06.22.05.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 05:25:15 -0700 (PDT)
Date: Wed, 22 Jun 2022 13:25:13 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Kate Hsuan <hpa@redhat.com>, Hans de Goede <hdegoede@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	"Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH v1] staging: r8188eu: an incorrect return value made the
 function always return fail
Message-ID: <YrMKKdvNqhydcBBY@equinox>
References: <20220620085413.948265-1-hpa@redhat.com>
 <5396e576-0fbe-430c-d983-a2f4b1569f09@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5396e576-0fbe-430c-d983-a2f4b1569f09@lwfinger.net>

On Mon, Jun 20, 2022 at 09:05:17AM -0500, Larry Finger wrote:
> 
> The "for now" part is that Phillip plans to get rid of _FAIL and _SUCCESS,
> and replace the logic with a normal 1 for fail, etc.; however, this will be
> a major change that must be done carefully.
> 
> In any case NACK for this patch.
> 
> Larry
> 
> 
>

Hi all,

I would be happy to work on purging _FAIL and _SUCCESS from the driver
by all means - definitely a worthwhile goal. I know Pavel said he
might take a look too though - copying him in therefore to see if we can
coordinate an approach - happy to do as much or as little as desired.

Regards,
Phil
