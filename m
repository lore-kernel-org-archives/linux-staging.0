Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A012C9C
	for <linux-staging@lists.linux.dev>; Thu, 16 Mar 2023 11:27:21 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so5029258pjt.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Mar 2023 04:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678966041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K0IO/AQ9Mn8bZN6TNRASOiDRFba3aBGD0p8Qua679NU=;
        b=MUqKCrUYoI4kephYYdiSzTGV2A1q0QkqsdzKy5Ta4UQ6PvZJaeTmGgMPW+4e6BFGdW
         pG3dSNQgvlp+tSP/2DbPLePvUPpZR4ZaR7OJ7rx2jhU26PgIXus5/zLE34vln2m+oJi5
         vOlCrHSftOfxJzcic4e4E9F0Ug8i7BygLP4PHLIwdB8hneO1Vjk3k26ubCfBDpOZPLZA
         6O7YWjsR9fA6DedemM/97bhz83FXi7emqLdC4v3Enle0/Zhnn8TMDRo1IGWYojI874hN
         deD/dB6jJ7kMOiEjW2K6aaiStMFXLO6rAECSPgh/bkNWQ4ls2CY48o8uK5P7FITOhemZ
         UTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678966041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0IO/AQ9Mn8bZN6TNRASOiDRFba3aBGD0p8Qua679NU=;
        b=i7YW5FJW0OOAyRVG+E1Mt8C0nE9/85uBvexEx7epIe8FdpqAXp2SvBqzenRPTKGR2Y
         kz2mfrFuuAFRR9P+VzLzC74xuv3dDhLpPbGwlhUebpHqTj3RfAdXbZbvcqVEtmoEH+vS
         7FoIWNlFMRnw0jdhIWg0K3FUZyBd4S00sDCgmXWPoR5gPdYwDZtxdSR6yRgXd6D0tE5f
         7dQND0qHBW/c8IEcAPfjP5VpoE741sibhoKhiRN3UyqFOIFRge6wbzvCAVhHZrM5PXsE
         bZJdG9TuyMklARIhkgFspSmF3eUE7RwoYhLNslPRkuNvJyjtZh/TODagwd3fYeFvhSLG
         Mahg==
X-Gm-Message-State: AO0yUKVL2bLledQrPPmQp48Gqql0qP+Wv3bvdEFUZTcOy8K+Y3YG21GU
	FQlX05jl+8HlsSBSIql050ZzugsEDqMKRQ==
X-Google-Smtp-Source: AK7set8CYL/5Eic8pxSsQpcmc/MaKf6/5t7Iplk95pK2Aigdwepl1iFXYam+TzCE2xiWCZP3fUUWDA==
X-Received: by 2002:a05:6a20:6982:b0:d4:5ae6:fbaf with SMTP id t2-20020a056a20698200b000d45ae6fbafmr4443415pzk.60.1678966040818;
        Thu, 16 Mar 2023 04:27:20 -0700 (PDT)
Received: from gmail.com ([20.230.228.239])
        by smtp.gmail.com with ESMTPSA id n18-20020a62e512000000b0058bc60dd98dsm5188451pff.23.2023.03.16.04.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 04:27:20 -0700 (PDT)
Date: Thu, 16 Mar 2023 11:27:18 +0000
From: Archana <craechal@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: drv@mailo.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] staging: wlan-ng: remove unnecessary kfree statements
Message-ID: <ZBL9FvE+9B4yuh75@gmail.com>
References: <20230310205917.2161-1-craechal@gmail.com>
 <ZAwwgsZd+2OAD1DM@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAwwgsZd+2OAD1DM@kroah.com>

Please ignore the previous message.
This patch is closed.

Thanks,
Archana
