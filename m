Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D74173
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 09:16:31 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id q186so24515897oih.8
        for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 01:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZRN5vWJAxkj8OOhK9WNkjB+abR7dFbVqjkPzo3NIMyE=;
        b=Tk1aG7x8bDsvpHwzPDDbjglqlnUBuM/Vw5/O7TeuPWe/+bbzVPDKyO1tJk/UhSQjTI
         wwEelgqnNno3r0HbDum2C2Xj5se6L8WD8ja36+tL0ANH9FjWTwcDy3rsNhdM2M1t+MDj
         Z4frco5gvIZzxwDAqQcVDvK2hscAkFfpel3jEZppPZl4FS/oTY6cNwGkuBzAL/fSNEQ1
         2vkTZR8MYcxfUyXIZHL1eutYwye/DnPqRGjxTfEJFWS6UA5ehqoH4KoYVZ+jGvifkvBK
         cOjM70cAG+/5rz6I3RIC03meJmF4bTyv1LAY30jppdYI+fzzqDQEJpD/E6SqgrNIAiCB
         T2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZRN5vWJAxkj8OOhK9WNkjB+abR7dFbVqjkPzo3NIMyE=;
        b=osOkPBIvW8g/TNjVTvbxccOdeB2gIpmRA6bIRhNRPhfXWtAD1kHuygr8ytf/RgO260
         A9qjoRbRARP3cp38qbxHN41TbSKTG6LSHyMKQKQIINP5OsoVRvc/N6UUOGGjStnyJVWN
         OpB+Kxy1cUa/4u6tYqq5rUHyL0YYV64QXO44I+n8sWSW8cDORGKH5ZYU5uU6+NaOUSgs
         PEBw7y8kW5Y3ECuc4kne7uc3fVmFmfcPLa9kakDSLDIKug/zp/Rv2lkRFTdIyDoTN8I7
         72Vhw6QBZLWs/KUAtfSrNNfiQc12AF7ym6yE8csVNz84+laQP1eP7WX+7X3yHC3n8epJ
         z1yw==
X-Gm-Message-State: AOAM532jw9zMjegNPoUwvlt3FKXkju1Z/0PXMuEeP7DRwFlUN9GN74wk
	OdIKn9a8o8ygxujbimnjAmuEpdT3ARb1oeLQXa4=
X-Google-Smtp-Source: ABdhPJxSI+GfoxY1I4bFw7NAKktdRprPZhTJ56hsLTsI80Qsx0BMUGA38IYXps5v363j0KE+U6M7QVUlQNu+aACpFIM=
X-Received: by 2002:a05:6808:20a3:: with SMTP id s35mr706861oiw.170.1643015790773;
 Mon, 24 Jan 2022 01:16:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220123181734.10402-1-makvihas@gmail.com> <20220124064918.GR1951@kadam>
In-Reply-To: <20220124064918.GR1951@kadam>
From: Vihas Mak <makvihas@gmail.com>
Date: Mon, 24 Jan 2022 14:46:19 +0530
Message-ID: <CAH1kMwSNtDAS26TsqWs+bm0B333dSJyK-m_XnU3pgoMZf1MGhQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: r8188eu: handle rtw_init_netdev_name()
 failure appropriately
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, 
	Martin Kaiser <martin@kaiser.cx>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for reviewing the patch Dan.

>> TODO: re-write probe error handling

Will submit a series of patches in upcoming days, based on the steps
you provided.

On Mon, Jan 24, 2022 at 12:19 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Sun, Jan 23, 2022 at 11:47:35PM +0530, Vihas Mak wrote:
> > rtw_init_netdev_name() calls dev_alloc_name() which allocates the name
> > for the device as per the given name format.
> > The name format is specified by the module parameter "ifname".
> > It returns a negative err code if the format is invalid. Handle this
> > error appropriately.
> > Cancel the timers ininitliazed by rtw_init_drv_sw() before calling
> > rtw_free_drv_sw() and then proceed to free the adapter.
> >
> > Also, if register_netdev() fails then goto free_drv_sw instead of
> > goto handle_dualmac.
> >
> > Signed-off-by: Vihas Mak <makvihas@gmail.com>
> > ---
> > v1->v2:
> >     free the adapter and netdev instead of warning the user about
> >     allocation failure.
>
> Thanks!
>
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Of course, all this code is staging code and terrible.  This function
> is needlessly difficult to read/review.
>
> TODO: re-write probe error handling
>
> Step 1: Keep the success path and error path separate.
>
> -       status = _SUCCESS;
> +       return padapter;
>
> Step 2: Eliminate do-nothing-gotos.  s/goto exit/return NULL/
>
> Step 3: Delete the vfree(pnpi->priv); from rtw_free_netdev() and call
>         vfree(pnpi->priv); from probe and rtw_usb_if1_deinit() instead.
>         Avoid a layering violation.
>
> Step 4: Every allocation function needs a matching free function.  Move
>         the rtw_cancel_all_timer() into the rtw_free_drv_sw() function.
>         Open coding it is a layering violation.
>
> Step 5: Get rid of the rtw_handle_dualmac() function.  It has a bad
>         name and a global variable.  What is the point of this function?
>
> But that stuff is for later patches.
>
> regards,
> dan carpenter
>


-- 
Thanks,
Vihas
