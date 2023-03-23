Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0498F4A;
	Thu, 23 Mar 2023 12:08:16 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id o12so85430543edb.9;
        Thu, 23 Mar 2023 05:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679573294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ztkH31CIfk39LS0OpJRftIe1GxALxXo0HeUk1ilWpA=;
        b=R+XfAY0cxu69eRIS8w3Brw8MAqi4WrcBKMJIiW3YcEEQcKAZ04vyvNYIPA3PrQuHww
         Sin7gSgTXQ3PxOIBQaubVMfqrFO8ABH2BviUbcTZ1mUBeZab6xsGaXz+RwkCWZzFhh7v
         7MAOxRON6c0U4ciwEtoHaVeNmR77r2EK53qCkKrrtuKFm5IWr6EUQZ+5WEYsyyVpu5RS
         Wr5jrvL9jP8+LwLUt0OnaHKS+pI6bypGJt4jqBJ9uctx2Sk4g+8wVrZAPpq+VFQL7j9o
         1+CFGYSOKglU0aHH/tIjPmp5qTPAHtO1ap8fGzPzIK58+4LUXPnrJ2VENtaOXJyChMW9
         I1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679573294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ztkH31CIfk39LS0OpJRftIe1GxALxXo0HeUk1ilWpA=;
        b=sshlwKRgyrHND5BG5Jm2cWAhvrkEbyPWJ0uj+Pdud8EStiHvNyKMrOKNl9PPBYml/7
         AtmgPST7wE3QZq0Uso26h8xqYt1pVrc1Xcr645onvAbiv+kXsDw2QZPRA0BTjHYIwvY5
         E5PwJhcNdpbgrQ8o/nKZXiXqxQV2EvQIKxaedS2Sj7pC6muETCz+DwBSpgtD56ALuP5e
         neQ3zyB0DuEVrwNhxC4VJm7CNsJJCDh3cLSChBTrKMYwd/klAq0JiKeF1l2B6By20V6g
         YuP3rg0Cy6EwGBMPh7EyRiwYl1MPLqI0grYukg3VxQH+Rx89rMat54TyghBWAZBANUbY
         +wHA==
X-Gm-Message-State: AO0yUKWbRfFsdTKe6zXTzmxDzaVRLNRbwwz1+VMHY/npl4b57VFiE7+r
	nUhqtBxy1laW/vGa0fK6+uc=
X-Google-Smtp-Source: AK7set/yjnAL+ZjoJJ1xfg3w5pvJOHklYTxPBQV6O3MLaQxRw3habMiwGqeUjv8GgtxOj6JFRpYmZg==
X-Received: by 2002:a17:906:2c07:b0:84d:4e4f:1f85 with SMTP id e7-20020a1709062c0700b0084d4e4f1f85mr10297836ejh.59.1679573294446;
        Thu, 23 Mar 2023 05:08:14 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id k6-20020a50ce46000000b004f0e11e071dsm9123376edj.73.2023.03.23.05.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 05:08:14 -0700 (PDT)
Date: Thu, 23 Mar 2023 17:08:11 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: fix line ending with '('
Message-ID: <ZBxBK0lg5p9+XcJ7@khadija-virtual-machine>
References: <ZBsSOlPbaGZcAaSY@khadija-virtual-machine>
 <ZBvbP8ugDFjSoVp/@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBvbP8ugDFjSoVp/@kroah.com>

On Thu, Mar 23, 2023 at 05:53:19AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Mar 22, 2023 at 07:35:38PM +0500, Khadija Kamran wrote:
> > Splitting function header to multiple lines because of 80 characters per
> > line limit, results in ending the function call line with '('.
> > This leads to CHECK reported by checkpatch.pl
> > 
> > Move the first parameter right after the '(' in the function call line.
> > Align the rest of the parameters to the opening parenthesis.
> > 
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> >  drivers/staging/most/dim2/hal.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> You have 2 patches here with identical subject lines, yet they do
> different things :(
> 
> I've dropped all of your pending patches now for the most driver as I'm
> totally confused.  Please resend them all as a proper patch series with
> updated subject lines.
>

Hey Greg,

Okay understood. Sorry for the inconvenience.

Regards,
Khadija

> thanks,
> 
> greg k-h
