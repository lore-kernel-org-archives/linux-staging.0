Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EEDD2ED;
	Tue, 21 Mar 2023 17:00:29 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id w9so62414108edc.3;
        Tue, 21 Mar 2023 10:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679418027;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7NfuYZYl2lEvY7O+jP13P2AL9n95q/VTZ/zGt9pnO84=;
        b=glbUWg50Hnfu7Zd3tlkJoCCDo74PDkfJuueO8D+or2kxsIeZZrDkWTgV949ro5QPNb
         sdNnh7S8n287cEqX1qaqL2dep6YoI63rbIhfDV/PbIqMjlP9/3NUhidZe7nU38ZFUSuv
         +5rl++l7X2mBz6Xj+l9cPMTSbHPtb7vIg7lYv8g7NEDKaF9UoivzKApajjyVDiaqBDNZ
         cE9BT/3Py3Mo65vNUZVgXTuXq4uUO9V91YZEDdlhvA2mXZZdCbrUqhdq9Y5HXtITsyIo
         NWjfB/vEVdkxL5SPctCfo+W7TUb7JW03CV5+adZwNI2KEcPsAKyn7NSNXqNbrP/ZrKjT
         n7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679418027;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7NfuYZYl2lEvY7O+jP13P2AL9n95q/VTZ/zGt9pnO84=;
        b=EGWUompqibtxbas9gD0nstefj5FNwCu0yKMB3tBO4/La8I41aNuQoKYdCZTjjNK0TE
         STpg6TZ8YOkkYXcH+jtc+eB3DzFrsTYygleb9XbfMQIrwYy74vmPrJc/Vqv+shUOWFPb
         0tKH/g+vgwF3SdoLCwM4HMrHQnbUEtUJv2d2GxfMF3PFnV4XOhbwRrq26fv2e0x3+1bl
         PJnhIPZ+xC5cwCY32lgVDkgcjJg7wuyHmkmRDlkOuFs6UBC246Vruji3iN7j/wczK/Y7
         OLsuqZLEzrT54Kr53K8BxVATZPFcZCMOnhMFwQj7Dt322CPPUl2uy2qcvGTzunQ69mod
         7U6A==
X-Gm-Message-State: AO0yUKUFmyxgUndfBEvWNy2WeasrZbqTsDPGpLaZyWSP3eaFrGPtDRdJ
	ovjyjOfsokofkn1CIQytl3w=
X-Google-Smtp-Source: AK7set9iswxufqF4ojgTt7Kr2Pb9D8RDsebKcaA4wGi0KxsjVbwPRySL69Cf2vuOf4UXdSt71XrJeQ==
X-Received: by 2002:a17:906:5a87:b0:931:a164:8efa with SMTP id l7-20020a1709065a8700b00931a1648efamr4034366ejq.70.1679418027468;
        Tue, 21 Mar 2023 10:00:27 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id hb6-20020a170906b88600b0093120a11a5dsm6077887ejb.92.2023.03.21.10.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 10:00:27 -0700 (PDT)
Date: Tue, 21 Mar 2023 22:00:24 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: remove tabs to fix line length and
 merge lines
Message-ID: <ZBniqDV+xjLcGdxI@khadija-virtual-machine>
References: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>
 <640e75cfd8fc_229a89294a3@iweiny-mobl.notmuch>
 <ZBge/v/K/BOVkl2V@khadija-virtual-machine>
 <6418fb683bc37_2c7706294e3@iweiny-mobl.notmuch>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6418fb683bc37_2c7706294e3@iweiny-mobl.notmuch>

On Mon, Mar 20, 2023 at 05:33:44PM -0700, Ira Weiny wrote:
> Khadija Kamran wrote:
> > On Sun, Mar 12, 2023 at 06:01:03PM -0700, Ira Weiny wrote:
> > > Khadija Kamran wrote:
> > > > In file drivers/staging/greybus/arche-platform.c,
> > > > - Length of line 181 exceeds 100 columns, fix by removing tabs from the
> > > >   line.
> > > > - If condition and spin_unlock_...() call is split into two lines, join
> > > > them to form a single line.
> > > > 
> > > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > 
> > > Fundamentally the problem with arche_platform_wd_irq() is that the
> > > indentation is too great.
> > > 
> > > "... if you need more than 3 levels of indentation, you’re screwed anyway,
> > > and should fix your program."
> > > 
> > > 	-- https://www.kernel.org/doc/html/v4.10/process/coding-style.html#indentation
> > > 
> > > I think a better solution would be to refactor the entire function.  This
> > > would make the logic of the function more clear as well IMHO.
> > > 
> > > Here is another tip to help:
> > > 
> > > https://www.kernel.org/doc/html/v4.10/process/coding-style.html#centralized-exiting-of-functions
> > > 
> > > Do you think you could try that?
> > 
> > Hey Ira!
> > 
> > Sorry about the late reply. Thank you for your feedback. I have looked
> > into the above link. Are you referring to the use of goto statements in
> > arche_platform_wd_irq() call?
> 
> I'm not quite sure I understand what you mean because currently
> arche_platform_wd_irq() does not use gotos.
> 
> But I think you are asking if I think it should.  If that is what you mean
> then 'yes' I think arche_platform_wd_irq() could use goto's to clean up
> the flow.
>

Hey Ira,

Yes, I am asking if I should use goto's. Thank you for the reply. Let me
get back to you after making the changes.

Regards,
Khadija

> Ira
