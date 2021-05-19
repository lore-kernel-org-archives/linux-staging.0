Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACD172
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 12:44:42 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id p7so10145132wru.10
        for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 05:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ScinkFGOJoc8OlIzl9hdR3ylpAQjgnxUkerv31RVSCw=;
        b=ZQLHHA737m6BkJjTJ61c8UM3q3uVcQ5xNivXeYgsfQTYrDK+XVLC6BnAv8wWz3Qerz
         VezzD1d0C+ny8ZI4bUNS9BdibN3/2iKMXeccFmZmPD9X4qrG9OyoPlkciD+w7inFJYUU
         7HcOMHbPkgziceFimusw+CjQ27X6qGRqPMknkZteKh2XtsHq6YGn7WjtJekuV2/v+co3
         GJRlPbeSh16OiqO6HpZLBMzadXAUdPHbO2t43N23gCQQSjNM9xGbOEzbJismEopasb8q
         x/aSVPR92ciFr6tVS/liv44RUC3ltNu/DBv6cMb2N9e9kLN0fWG3Tq2lwKNYngrOEbI4
         /Ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ScinkFGOJoc8OlIzl9hdR3ylpAQjgnxUkerv31RVSCw=;
        b=K+JHg3VcDskwY4egtKmXkUcqq/wTx1Mdq1K62/WREAiao7ro2HE/E6doy9sXhjekGA
         bdlQyFAbFaLU5c/Q1EwLJkalcPmo8QWQYBQdO7g88tr37XoQAnnXZCOqR6yIcsYf/IGp
         zSTMehdDQm3Vt7HI1sroVSVzVqsnPC9QHNeFKjDRkT8kVFo/4YFyyoP6jf7lJ94DnfCS
         VuFgL28NHk3ygjU7SWm/06SpAqH0Rvnk2KyE/KhztwoP+Z4cz11I521iMwAbabTJeg2x
         XytWz4Z2SPrMkIxOPHNQfJJRFjTIThdX6iuFb+8jVBbbW1gHK2pWTTf+RKqqoOSY0sgw
         G1rQ==
X-Gm-Message-State: AOAM532scMnleWIX6gIoNR4WN/IvbCaozjLcfJTMZPDFlLLgKwKfU96d
	0y4lX/8nvqHstHd7srr8Fuw=
X-Google-Smtp-Source: ABdhPJzR3yfTJ3agrm7I7IPuHEFVUV+G567MXyJj0bbbRJm/v+J0DQHlQJ0SsSEtozdC5HSBYC6pGQ==
X-Received: by 2002:adf:ea82:: with SMTP id s2mr14264120wrm.397.1621428281538;
        Wed, 19 May 2021 05:44:41 -0700 (PDT)
Received: from agape.jhs ([5.171.80.197])
        by smtp.gmail.com with ESMTPSA id x2sm10905721wmj.3.2021.05.19.05.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 05:44:41 -0700 (PDT)
Date: Wed, 19 May 2021 14:44:38 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove if (true) statement
Message-ID: <20210519124438.GA1417@agape.jhs>
References: <20210518144335.1677320-1-hello@bryanbrattlof.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518144335.1677320-1-hello@bryanbrattlof.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Bryan,

On Tue, May 18, 2021 at 02:45:19PM +0000, Bryan Brattlof wrote:
> 'if (true) { ... }' will always evaluate to true. Remove it and
> save a few tabs for somewhere else.
> 
> Signed-off-by: Bryan Brattlof <hello@bryanbrattlof.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 159 ++++++++++++------------
>  1 file changed, 78 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 9df4476b2e2d..98b1bec67999 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -59,112 +59,109 @@ static void update_BCNTIM(struct adapter *padapter)
>

I was wondering why are you using the first patch of a nine patch
series as a 'cover letter' of an eight patch patchset.

In other words, why putting the In-Reply-To field of all patches subsequent
to the first one ponting to the first patch itself as a cover letter,
is it a recommened practice?

thank you,

fabio
