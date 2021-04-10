Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CE471
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 09:45:21 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id u21so12326055ejo.13
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 02:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=moesTed4SVvjaNssZNC/2a+G5e9IgTbR1YQQGq/nOzU=;
        b=MWRDyMOnBOY9P85izdF6hnKFStsJyXxJ9F/MYorK3rfWvKQ+wJXuUxkBEBwL02H3jE
         wa++ClxVuTMr+B+zcOVFWZAcfcGP21+VWc8xH31dXXK6+7drtQDapNjBwedSMDXkRWkB
         XaitJhrrtRVDE2xGmYOfpA4TTalHHFEggMa/9OfI98KaIQDB/5v2OUitWBYjMbMlansU
         VumQiVl8Wr6Wfkb7Zkkqo5HQXZV31HHpP+K19cRk5YwQo+DpzN6XL6WGqeGsMKBRlg9z
         Qw9koEAffMF1fhc0l+w0shxSlZCyGB8XEwTyvQvf3tw1PAcBeMYlDmtRMDzHMGMKKslf
         OE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=moesTed4SVvjaNssZNC/2a+G5e9IgTbR1YQQGq/nOzU=;
        b=IrmsnpSef0jB7dKOMjzYEDylYpN3QlViLhvV0JoeD9h8ooY/lqj+gzIiov5PCU3c1B
         ohVZgY0YdWrcQlmkQP7065pEpXuNGljDsQTUSzuDLXYckqHISntLNqeUo3eEBcj5rtFg
         t2qvzG6+2zzS9ugxx+FwSllBfQ/eWmrP3RaaMaKrC7IBvZ1MG7BkMBQb4vd4EJc96quY
         AAzSFGvuz28ypq7Omu08zEphWC++pXZ/NYdT3ct3lezxnRFhRF4REfvNeVf9LAuLYY1T
         A6cNNPbhzc0N+Z+3Pp63Hu/fUn6wikErVKt7c/hzPYujpN7LQKgGtPLz4JkgAEJ/8vWJ
         yfxw==
X-Gm-Message-State: AOAM530hYmSq133Nm/cecoU2ybwe8unOJd259XoV0NarC4W3VvbvFyTO
	MgiUAE4mQg0egToxAgSoQHA=
X-Google-Smtp-Source: ABdhPJz1b2YxObuf6ixc8ARr8196K5I+q7NVJqfPK2KTgGRDUDS8KdYIDasUAwFQZEcLa4h/7ug0mA==
X-Received: by 2002:a17:906:5413:: with SMTP id q19mr721766ejo.8.1618047920066;
        Sat, 10 Apr 2021 02:45:20 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id j1sm2434983ejt.18.2021.04.10.02.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 02:45:19 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH v7 1/3] staging: rtl8723bs: Remove camelcase in several files
Date: Sat, 10 Apr 2021 11:45:18 +0200
Message-ID: <3026831.3QyE5GyAct@localhost.localdomain>
In-Reply-To: <YHFwkJlTNxQwPyN3@kroah.com>
References: <20210410092232.15155-1-fmdefrancesco@gmail.com> <20210410092232.15155-2-fmdefrancesco@gmail.com> <YHFwkJlTNxQwPyN3@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, April 10, 2021 11:32:00 AM CEST Greg KH wrote:
> On Sat, Apr 10, 2021 at 11:22:29AM +0200, Fabio M. De Francesco wrote:
> > Remove camelcase in bFwCurrentInPSMode, a variable used by code
> > of several subdirectories/files of the driver. Issue detected by
> > checkpatch.pl. Delete the unnecessary "b" (that stands for "byte") from
> > the beginning of the name.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> 
> Why is there a "v7" in this subject line, but not all the other lines?
> 

It's v7 because only this file (and not the others in the series had six 
previous versions that you dropped. Please remind that it was already sent 
alone (not in a series) several times. The changelog is in the body.

Should I drop that "v7" and the changelog, and the send the patch series 
anew?

Please, I'm waiting your instructions on what to do.

Thanks,

Fabio
>
> It should be in all of them, including the 0/X email, git format-patch
> will create it automatically if you tell it to.
> 
> thanks,
> 
> greg k-h




