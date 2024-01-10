Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE72C39859
	for <linux-staging@lists.linux.dev>; Wed, 10 Jan 2024 07:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mydsvvoe"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e5701cbbaso1015845e9.0
        for <linux-staging@lists.linux.dev>; Tue, 09 Jan 2024 23:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704871581; x=1705476381; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oB8bFEksgA/hP4pzljJqPyULshxwwfCWATJRRhxV3mo=;
        b=MydsvvoeVUxl6L2plbjcjnBqITSCytM6WoqSL1UdizIbku/sbU1KU0yIpLgfziS320
         ps93sJa3JUDj2wUcM9i6BjeQoWYyzh0nIUlTSyZbEUg/1vJ+UhMi82we0GZ9mvDxu7sQ
         DHvMkxYljKX3XVWWik8IC+RVfXwNAeboffS4+eOrvLxfIaQvjDAuygEe2bWUM1KDktQe
         wkTkpX937fVtHjXhXulaapX8ZMPLLmZVGdsUwF8C8K4ABYcTl0SlFdF0ocRhp0jcRtdm
         9WfItY7koYoOaa4tVgbbzZxgMJe8s65iXq9u3oncF15jgsP9UeRMFo5N0opFtyBz955A
         ZcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704871581; x=1705476381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oB8bFEksgA/hP4pzljJqPyULshxwwfCWATJRRhxV3mo=;
        b=uVYeKYgxq1Sjn+0dpF7vRngj1TUbK7OvbWCRbgBEtKcur6p/EPaSAbnZJqtdjdGyvZ
         0chfdfCRy1NHcfIwq/LKJqY6ZgMJT6v6WX3tvP9Ko3iQrBXE3Vr+oHnph/SpNbRwHA4V
         zZ3BjMFSItRZquGvMrzdQ1MDvyu+zbJQic9WyJTkvJDljfTolDKuY1+/t7rPk2ppG1sA
         nJFRiffkxRnzr8PgfBOb+xk2jPe0YsEB0Ma4PLro7OoXzfIxSRaAvGgvBYvHhd/UonS5
         w2xUTtvAPDg/kfz/QJPvovGxbPzROliZXkVBmsmrPVjUcCQWHppG47uYD5l1Ae5G2pUe
         B3SA==
X-Gm-Message-State: AOJu0YwRTbJ0+ZkHBS5K1sETrd3ce1imM35xe+GdWnqV9x8M9FrDlTcC
	drKcaF2Aqq4LqWZjG+Zn+GwXOKWBgl798w==
X-Google-Smtp-Source: AGHT+IE76Y8hprK6/FX8obW26kFU4/Ec8lUy0x0+lATk6+++AhIfumsuIrzjjbjO9pLr10ZilSlScg==
X-Received: by 2002:a05:600c:1d08:b0:40d:8ed9:ce8c with SMTP id l8-20020a05600c1d0800b0040d8ed9ce8cmr302530wms.120.1704871581188;
        Tue, 09 Jan 2024 23:26:21 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id fs23-20020a05600c3f9700b0040c11fbe581sm1129574wmb.27.2024.01.09.23.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 23:26:20 -0800 (PST)
Date: Wed, 10 Jan 2024 10:26:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthias Yee <mgyee9@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: fix open parentheses alignment
Message-ID: <3778e52d-9ac5-4648-85e9-539b13e19d25@moroto.mountain>
References: <20240110072304.2226-1-mgyee9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110072304.2226-1-mgyee9@gmail.com>

On Tue, Jan 09, 2024 at 11:23:05PM -0800, Matthias Yee wrote:
> Adjusted whitespace to fix checkpatch warning Alignment Should Match
> Open Parenthesis.
> 
> Signed-off-by: Matthias Yee <mgyee9@gmail.com>
> ---
> Changes in v3
> -fixed line wrapping for commit message

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

