Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76677191;
	Fri, 15 Apr 2022 02:51:55 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id b17so5729774qvf.12;
        Thu, 14 Apr 2022 19:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yHG4RTfLs3izK4POBBX3OO4Xti9SeDZkZKSmtbKLbz0=;
        b=H1L8OA2uxN+e9KYvFwRTQoTkze4E6CKkRG15sEmWhV+jNE2OBN91ow1ArTufc4XnPX
         rIxL+iEUic98cZYlVaTcp125vee1CclSoRNxW9mX4N8Upl+Vl6aPzrLzuInNOip2yGva
         pNbq8vNlDI5cXSgUKZCj0wtwD8491AfGlNTaHyjzMxbmA6P8XG31aMig88n1hfc/j7l4
         /xQWP4VWvtiu4IO3W6Zyc6E6QWjVq1Ff4C+FniH7tmagR+Bwmc0P7j8wI9+DWtpKFkqg
         d2OKfbGNpqBq+b9Q8wSBJVuK/sgIAp4Qp6DCX92414hKkqKmQ8gVpduumI7ldVpCGxRy
         AZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yHG4RTfLs3izK4POBBX3OO4Xti9SeDZkZKSmtbKLbz0=;
        b=kd+bkg7DDgn/jxcfELvTnMyW7OjD4kbZwgiCUXl8z8KGeXmoI/zDFuCggR5C3/rERH
         jkSU4zpH8kDTAczSshXbpS22peBTt8WVD36ePPMNocVLNHUR9heQ+3kzCQSXH2RP5yTE
         UvVCmgaARDxTzagBkIK0gRR3r8G3Vca+gOyl8EJpOIM/vSVgViojcbvfrO+gCcZnpUiF
         r4YDrC7aPyi0r+fMz6fKUC+TBuar12TYhLFpvhVAR+05AlTx5xImq8dIe/ciYyebS8PE
         jWm+5xWu+2/qbEbY8+vmHJSeCsXp9IqLVs9IiC/+JRIdhiLyGLeynRvBjPE3pHiBwY+1
         1k1g==
X-Gm-Message-State: AOAM531yM/+dFEpBE3ZV7UXv476mu0VkE2Tq+dVU4KZq0AOYKxsyAja/
	L1TXyX0QHb5thXQvNeOpok0=
X-Google-Smtp-Source: ABdhPJxSuarSH8KOah4mgH+Moko/hRAN6yMOuAxrxP8FPMA4xiQ9fHcZjOpO6LJsWCOpGWVAHaXSfg==
X-Received: by 2002:ad4:5948:0:b0:441:5d45:6d62 with SMTP id eo8-20020ad45948000000b004415d456d62mr5899708qvb.25.1649991114367;
        Thu, 14 Apr 2022 19:51:54 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([2607:fb90:1b7a:2349:50b1:5db4:a2d5:7054])
        by smtp.gmail.com with ESMTPSA id t198-20020a3746cf000000b0069c51337badsm1884570qka.45.2022.04.14.19.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 19:51:53 -0700 (PDT)
Date: Thu, 14 Apr 2022 22:51:51 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH 1/6] staging: r8188eu: remove unnecessary braces in
 single statement block
Message-ID: <20220415025151.GA33625@jaehee-ThinkPad-X1-Extreme>
References: <cover.1649880454.git.jhpark1013@gmail.com>
 <4a0f2a0f24321c5b2039f0f8e6132cec4a2ef068.1649880454.git.jhpark1013@gmail.com>
 <3f4a6c08-4434-1865-bc96-984152af5af1@gmail.com>
 <20220414194118.GA4144553@jaehee-ThinkPad-X1-Extreme>
 <8bd1cc3c-c28b-b30f-d9ff-04f9a3c79646@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bd1cc3c-c28b-b30f-d9ff-04f9a3c79646@gmail.com>

On Thu, Apr 14, 2022 at 10:50:52PM +0300, Pavel Skripkin wrote:
> Hi Jaehee,
> 
> On 4/14/22 22:41, Jaehee Park wrote:
> > > > @@ -112,9 +112,8 @@ void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
> > > >   	rtw_free_mlme_priv_ie_data(pmlmepriv);
> > > > -	if (pmlmepriv) {
> > > > +	if (pmlmepriv)
> > > >   		vfree(pmlmepriv->free_bss_buf);
> > > > -	}
> > > 
> > > If pmlmepriv is equal to NULL we would die in rtw_free_mlme_priv_ie_data(),
> > > so this check is just redundant
> > > 
> > 
> > Hi Pavel, thank you for your comment! If I'm removing this if statement,
> > should I include vfree(pmlmepriv->free_bss_buf) in
> > rtw_free_mlme_priv_ie_data?
> > 
> 
> Hm
> 
> Simple grep shows, that this member is just unused
> 
> 1 drivers/staging/r8188eu/core/rtw_mlme.c|64 col 13| pmlmepriv->free_bss_buf
> = pbuf;
> 2 drivers/staging/r8188eu/core/rtw_mlme.c|116 col 20|
> vfree(pmlmepriv->free_bss_buf);
> 3 drivers/staging/r8188eu/include/rtw_mlme.h|322 col 6| u8 *free_bss_buf;
> 
> so looks like you can just remove free_bss_buf and all related lines.
> 
> I hope I haven't overlooked something
> 

Hi Pavel, Thank you for your review! I have sent a second version of the
patchset.
Thanks,
Jaehee
> 
> 
> With regards,
> Pavel Skripkin



