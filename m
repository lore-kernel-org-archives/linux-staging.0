Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD66D7E
	for <linux-staging@lists.linux.dev>; Mon,  6 Mar 2023 09:13:47 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id cw28so35555427edb.5
        for <linux-staging@lists.linux.dev>; Mon, 06 Mar 2023 01:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678094026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fF1pLE6MLalezdRHlayTB3V70cyFMdizZYI29UXUL0g=;
        b=eUGDW7VzfYhZEVoGV3JVqkjAFiXZV4MbcZQGrDgRRZwAgEPeeaenubo/KSmQRxQ2nX
         SVtjeQLLwNRIedWhHGMX0ctjuCO41TStYJen5OCCzZASGvZUgiUh0RJafGemKLpOjIRG
         YDDU8/ffC0hc0E0m0sX1ODKNhCjp2/y2mz1u7wDxDbKY8y8+WAZtjgXqDv5lMw2O8uZW
         i3mSK68AeahgoLJ0q8Z5AhmMWztrGOODL3sA22vCGsm+v86iOQyELHssvdWUTX9rfvHf
         k8ZsKDPmj0Mr7AGkhm0ViFCc8HB/ssTmpoIBKE93jPkWxGaUELI8OJCO2gy90g6jVNGd
         5mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678094026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fF1pLE6MLalezdRHlayTB3V70cyFMdizZYI29UXUL0g=;
        b=MW+/IKyNItzFIt7lKO6Oi8r9/c9U9UU3cjhVGSYfszbbUHhfUn2jgqmcO2bx/Uq9ac
         Jz9TVLJ6/gqV5PED+fOdde3wISpDUoLxV0+WKwGpgHsMN3vBHntZ5Ao/MpQP3NFzwi6V
         gNyjnAWYsRM3k+kv6bqvnpICk0yE6li5yOdrSqMGt0iWO94GloRxiiFrk9cb1ixCj09q
         IeaDCPfOlmQZrCy/YoIJ7yQb4nFOBrzo12dxZLmyaQsLCgcPm+g7fUK9AJy4KcIlfl4L
         glyFtmBC97c0S2NxDjDC3a8stPN/hls4roXmFDog4T/eT7wWsk+Yiuk8hLEWGyb9rBMO
         a5Zg==
X-Gm-Message-State: AO0yUKW5XJoYZ7eeZcMF35FB0N19bFZPpvw17WraQrGElDd/UiEDFCfc
	xzVjrpZcGSFiK/81DHClDfeX3jf008W9HQ==
X-Google-Smtp-Source: AK7set9P7Xp90TDbuIGvAc1neOTW5OolV/ezDUsJGW/fblOfR/k33lyMgNGaPW8I5e3xG/rvDPFMuw==
X-Received: by 2002:a05:6402:384:b0:4af:6aa6:12d3 with SMTP id o4-20020a056402038400b004af6aa612d3mr7674547edv.40.1678094026128;
        Mon, 06 Mar 2023 01:13:46 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x20-20020a50d614000000b004aeeb476c5bsm4127705edi.24.2023.03.06.01.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 01:13:45 -0800 (PST)
Date: Mon, 6 Mar 2023 12:13:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8192e: Remove empty Array
 Rtl8192PciERadioD_Array
Message-ID: <549c5cc4-8acd-4894-893e-f8cc81ef1458@kili.mountain>
References: <cover.1678051460.git.philipp.g.hortmann@gmail.com>
 <e8842422d34fd19592047ad821c0dbe2eb4bcdc9.1678051461.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8842422d34fd19592047ad821c0dbe2eb4bcdc9.1678051461.git.philipp.g.hortmann@gmail.com>

On Sun, Mar 05, 2023 at 11:33:18PM +0100, Philipp Hortmann wrote:
> Remove empty array Rtl8192PciERadioD_Array and the code where it is used
> because it is dead code.

It's not really empty.  It has two zeroes in it.

regards,
dan carpenter

