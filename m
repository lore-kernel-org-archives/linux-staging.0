Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41D3EB24
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 09:45:03 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so7878198wma.1
        for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 01:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fNBK4QqpY340G3XV9v4iOSyaQo0TRWeIslb8zESvqLE=;
        b=EsXgxdwDGtli4wpNVj7WBXbE9x4pV9ASGAdalZffmwJv3ubhkgi5w3kywjoSBubvrF
         FSLpb6nr5AHwpqexI+G6JUD2lYvnyi8JJxwJ+fJbMeZGWI/FOJHI3yvxfXgL4Xetw+ss
         uEdzTVhX2dywawhL8ncFrc5dZ2j2cn0o/UA9rnRYOUpG0VJlCeXjjkz3kXi9JXTbbEmN
         sJDP0yhfNe2EKW5FWwhmx0WOUK/YqgvqKtNiwUXMBR/UnX1iRzsmqQiCf9GlSk9LzZXO
         /Nu+KuPRbW0Z1isrScZ90BvHfUJx4pKtsxC4BjDrKaWrbP7KbnQDZYBPoYWMfdMh+H9Z
         R1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNBK4QqpY340G3XV9v4iOSyaQo0TRWeIslb8zESvqLE=;
        b=SR3p3rjwUrwyhbc5RDjLG6CxKQq94aMnUNtyPtSCXxPSfByMzj/mVjq7+mvV/yYKmZ
         GYsC7Dv5Xh3jRbE/0cYhzV6kjh0GsshWyu0TqFFxPx/JIq3Jh2kp3lqwQmGwSiuwiyEK
         SHN2qwxm6yc//QeS9J/O7uHt7OtEKDGPr7xZYE3hjKKm12uWCdcn1Vkul/IZOE2wfL/B
         +SC1+yrwjZ4/NQ4PvzGaXPPFjJeVcatwkgSZVDFvqPEmV/QKr8h4uMBTYRiJWAKBtUg3
         cEQdcURr/oa3g6wdqNAiTeeTm1sKz8DTx0TdyxALj/MKbbjtyrIjMEOvTAqryIi8D7qV
         STDA==
X-Gm-Message-State: ANoB5plD/HV6mPM7AP/X45qF/VwyxxBoUE34h5fFxoPnwpTwSnDCSXPZ
	zv3n8CAIXei9Y9PU6CiSs1w=
X-Google-Smtp-Source: AA0mqf6d8cfU4hNSGLB0APXRKgv6Kojpb29bspmLAqKJe36EnnZdCMYe0G6qOdGyD3oOdoh6vs3Gtg==
X-Received: by 2002:a05:600c:3c96:b0:3cf:a457:2d89 with SMTP id bg22-20020a05600c3c9600b003cfa4572d89mr33816286wmb.20.1669455901774;
        Sat, 26 Nov 2022 01:45:01 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h9-20020adffd49000000b002383fc96509sm5654788wrs.47.2022.11.26.01.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 01:45:01 -0800 (PST)
Date: Sat, 26 Nov 2022 12:44:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ekaterina Esina <eesina@astralinux.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Won Kang <wkang77@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] gdm7240: Add check for NULL for callback in r
Message-ID: <Y4HgF21MXyb9YH+h@kadam>
References: <20221123132345.7071-1-eesina@astralinux.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123132345.7071-1-eesina@astralinux.ru>

On Wed, Nov 23, 2022 at 04:23:45PM +0300, Ekaterina Esina wrote:
> Before dereferencing r->callback check it for NULL.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> Fixes: 61e121047645 ("staging: gdm7240: adding LTE USB driver")
> Signed-off-by: Ekaterina Esina <eesina@astralinux.ru>
> ---
>  drivers/staging/gdm724x/gdm_usb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gdm724x/gdm_usb.c b/drivers/staging/gdm724x/gdm_usb.c
> index 54bdb64f52e8..7cf89f4c95c4 100644
> --- a/drivers/staging/gdm724x/gdm_usb.c
> +++ b/drivers/staging/gdm724x/gdm_usb.c
> @@ -409,10 +409,12 @@ static void do_rx(struct work_struct *work)
>  		switch (cmd_evt) {
>  		case LTE_GET_INFORMATION_RESULT:
>  			if (set_mac_address(hci->data, r->cb_data) == 0) {
> -				r->callback(r->cb_data,
> +				if (r->callback) {

What makes you think r->callback can be NULL?

So far as I can see that's not possible.  It is checked before it's
added to the list in gdm_usb_rcv_complete().

regards,
dan carpenter

