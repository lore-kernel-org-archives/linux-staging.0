Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010987F
	for <linux-staging@lists.linux.dev>; Tue,  2 Aug 2022 22:15:20 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id bv3so5532476wrb.5
        for <linux-staging@lists.linux.dev>; Tue, 02 Aug 2022 15:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=te5wUeGLhF3nWkigofz03L7C8EoefvpKcxV1mA0vXXY=;
        b=6g/wHFujdV6ZhryoRuc16wJv6yZoi5OEWuBrrww7dK47p8omkeJfYKdiJtAtWdKQBE
         nEiZPCP2iRylTHHy0y+UH6T4nTxQi+Gv81uA8azJ0Ucn5lM0DFH37G7v7agI3QnkdHxj
         bJUHkP1CyJ0OWxI3tiMfsocgStifvciDBDmJrUxqBg4cHHJrPJZ5r4rEXFfDD6qwy/U3
         pCPVISDIMyWujSDuPwRF76Ehd6YY+MmqPRFpDtEYrY4mE5s4wPiDqMPidoBNzxUqYZsh
         Af9SDa61I7GiWbnorAiWOdBZ6Y6rWaaUbS9oesEZSB+Z1wi2O/7e67PfigTOW9e+atpQ
         XltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=te5wUeGLhF3nWkigofz03L7C8EoefvpKcxV1mA0vXXY=;
        b=5MA6vlEbl6D5snbKEDqIXjGRV3zes/knPe4XEb5XouPd2BNstuT96UGbVLFqRAYixq
         nk4tiikWKmhJiG6lp3cqL1qAmeQF4aBU8mSRpnVsy44L5L8sW42ZcsulRu2Z2KDhVqsr
         B/tcpHuWpPpWb4H7Y4WSCGNBuwpilhpCqYBfI+tXZ3udfYlavxF4rBb0xcodac8sxj5u
         7mOPkC8kyb9xzpnHJcUwy1Xk55G3GNIdzKMei5n0oaIGCDWKM0o0/inEv5MN9b1G+Pp8
         iKzTAYbt3K83TLJFyIzo+7SEYDlFOP5zDJc7qFraQAmPY8VKVcKj1Nv8rQQHrr8bU32p
         kxPQ==
X-Gm-Message-State: ACgBeo3VWVx305GZF13Vd1PbwmYWtdOMgLWBfA0PAfTGpRwuBp5lNCJS
	vUiyvFhPdXaRciQz5cXhgQPnUw==
X-Google-Smtp-Source: AA6agR5Q2oxb04fLypbaaOJycRgYEjlbfHiP9K0j/xrCe7RGQAt57BLcV73od3J2TRMq0qgwRMTEdw==
X-Received: by 2002:a05:6000:5ca:b0:220:78de:1c39 with SMTP id bh10-20020a05600005ca00b0022078de1c39mr927810wrb.524.1659478519215;
        Tue, 02 Aug 2022 15:15:19 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id bg7-20020a05600c3c8700b003a3186fa559sm61768wmb.29.2022.08.02.15.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 15:15:18 -0700 (PDT)
Date: Tue, 2 Aug 2022 23:15:16 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com, martin@kaiser.cx, straube.linux@gmail.com,
	fmdefrancesco@gmail.com, abdun.nihaal@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: r8188eu: convert rtw_set_802_11_add_wep
 error code semantics
Message-ID: <Yumh9NLeDAMJBJ48@equinox>
References: <20220728231150.972-1-phil@philpotter.co.uk>
 <20220728231150.972-3-phil@philpotter.co.uk>
 <2e838551-e6a3-df5d-a889-baf60c7f99fd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e838551-e6a3-df5d-a889-baf60c7f99fd@gmail.com>

On Tue, Aug 02, 2022 at 11:10:21PM +0300, Pavel Skripkin wrote:
> Hi Phillip,
> 
> Phillip Potter <phil@philpotter.co.uk> says:
> > -	if (!rtw_set_802_11_add_wep(padapter, &wep)) {
> > +	if (rtw_set_802_11_add_wep(padapter, &wep)) {
> >   		if (rf_on == pwrpriv->rf_pwrstate)
> >   			ret = -EOPNOTSUPP;
> >   		goto exit;
> 
> is it intentional to ignore an error in case of rf_on !=
> pwrpriv->rf_pwrstate?
> 
> 

Hi Pavel,

Somewhat yes, in the sense that this is existing behaviour and changing
it is a semantic change in the driver, thus arguably outside the scope
of a patch/patch set that is intended to just focus on error code
handling (moving from _SUCCESS/_FAIL to 0 and -EWHATEVER).

Not fixed to that by any means though, if you would prefer it be
restructured as well. I need to do a V2 for this anyway.

Regards,
Phil
