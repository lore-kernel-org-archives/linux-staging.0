Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589FA8F6D;
	Thu, 23 Mar 2023 13:34:51 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so858488wmq.2;
        Thu, 23 Mar 2023 06:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679578489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qo6P5WDnhoMfi3lKTlvIX6M6cZHaujHpVvQIbrEWH0Y=;
        b=j9Fm4p2c81n9IIu0neqEAPqcST5ZuZprU3xOybNhBR5T3b1LoR0wrL01Y9VHUJJjWy
         2tR59ZZ4TiorD7up6HQ+SFtDPdfM2n3dd3bGhrqRo7YCE1RK3b8lSmOQXmjuybSjAHfm
         K2fsgq1i5r1Kx32/gCMmBQE5klSMRbT1Kp+/SuG6jHzeixlwIMdMGhMKi0pL3pqsFTqx
         maniGPfFSvW6IeNOWXHLWu3o4Bkj0PcP25+Dw3MWkZcbvHALl7njDrwA+bO2SBinGPh5
         asxt7PbSXJkWp7RL1kshG2CLGV01QS9HfkO60sqIbQXQaEfyzyesod5qvshbxkqu0INP
         SMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679578489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qo6P5WDnhoMfi3lKTlvIX6M6cZHaujHpVvQIbrEWH0Y=;
        b=FKd30fjR7hPc1yiEYKPUlVrT4UWYtASx0PjOsvBumi9/HDZNsiDjsardXkXjFiU3A1
         yxK4s57iL6CaghqFFB9AAvJaekkOCTMxjdz/nq+GUHTboOwz8pvDOLgv0Q30z2LZa/Dh
         2aJB9adExJGQ/ZPVzZaiOG59cHY/FNHw7JwDxnGTKehDZbQaQVFyvUdcNL39fr+ecUk0
         iRLb2JRb2PagoJanuiOdvHmaNIur2f0o35CBHBDarkYHE9pVIvGIFA6XyE8lui8/YyT+
         IXuOqw6aXz9Aqd5vBfex0lTQnn3r71O8KikXUPl1paLcstE2MzNzwoy2d1xy8qQY/kOl
         krMw==
X-Gm-Message-State: AO0yUKWIS4TL6+OgktUWdslC04wXx21craDsbs+YPQHonDYDkucuLzG/
	fI4Csa0X6ii04gZrrcsl5xc=
X-Google-Smtp-Source: AK7set9alsrOQ0GuGSNJ+hEsgcjZ26COmLBvvu3y32blCStZkGuBrJLqaf/DpmpQy5hOatwdZzCMTw==
X-Received: by 2002:a05:600c:c85:b0:3ea:f883:53ea with SMTP id fj5-20020a05600c0c8500b003eaf88353eamr2485491wmb.7.1679578489513;
        Thu, 23 Mar 2023 06:34:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bcbc6000000b003ed243222adsm1853621wmi.42.2023.03.23.06.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 06:34:49 -0700 (PDT)
Date: Thu, 23 Mar 2023 16:34:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Khadija Kamran <kamrankhadijadj@gmail.com>, outreachy@lists.linux.dev,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 0/4] staging: rtl8192e: code cleanup patches
Message-ID: <090ee842-46d0-4f35-bf00-68a3e1393b72@kili.mountain>
References: <cover.1679573474.git.kamrankhadijadj@gmail.com>
 <alpine.DEB.2.22.394.2303231408000.2866@hadrien>
 <alpine.DEB.2.22.394.2303231408410.2866@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2303231408410.2866@hadrien>

On Thu, Mar 23, 2023 at 02:08:58PM +0100, Julia Lawall wrote:
> 
> 
> On Thu, 23 Mar 2023, Julia Lawall wrote:
> 
> >
> >
> > On Thu, 23 Mar 2023, Khadija Kamran wrote:
> >
> > > Fix several cleanup issues reported by checkpatch.pl in module
> > > staging/rtl8192e in file rtllib_rx.c
> >
> > Why is it resent?
> 
> OK, I see, sorry for the noise.

I'm still confused...  :P

regards,
dan carpenter

