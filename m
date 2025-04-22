Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE9D19D8BE
	for <linux-staging@lists.linux.dev>; Tue, 22 Apr 2025 06:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303305; cv=none; b=A1Pp/GY2GYvbcQ5BHpGgmCt0cmsLr+Jfu7bkm2JizJRWR5nKgtpS3tzfh4AyLATVzLr9go3rAq8ruD7+Np8fxzOFpoJJiucn+OmrIZpMyDe/URp0lSBXiRVTcp6XNWt39XUSZwL2j1TvXGM1bDs8cCPR3z5yvPKjTtMz9JDo+kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303305; c=relaxed/simple;
	bh=L0MQ41gVIL0v7VhE4x6ghYCWQYaXBs50GI0zvkn/IuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjDaHm9xrfBy6cKwXBMZIGbj3qTflSsI0Z2A8KGNz4nigN5Xj+jlza4n1FPQOlOxPN6Gtr7yy4vEzFB9cEiio/UhgWFhgAawUI+ihVzf4Wi0/4EISyzUyVIMWS58nbHlfOXTN670yz/aNJQte3himAguDll8Ix22EGIImSVDB1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JjEXY+Rj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JjEXY+Rj"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so3091979f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 21 Apr 2025 23:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745303302; x=1745908102; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CR3emN5pt/2Xy36pQPHQVyv8ABB4y5f35y7rXhRz1Tk=;
        b=JjEXY+RjRc3tKLU9RaSp2OL2zgWixLY3Fv++yVbW3r+qXB4lzqvs7eUTRD3uF+ufFL
         wv7G5JUhYWzadjrCa43sxB6Vh0FKItZv+Y7YQKuSHocZ6LpiXE871NYW84eZnnOlpvTP
         Po5+iF1XUDnmnZZEc4NU6yCZdjWIdz1LFtk20N/EmXabS/yr8dYFlg9e+Ij7evUa5ctc
         nLHgHkijjt3bZgpzvUrfBuJStbAXQjS71rqg6kL9johnPfcDpmCEXhBZwtFZxPqyNqZH
         ShSG44AMZd9MRJdzH+KB/OROB6JVmD+8snnZAZuKGrDqVPLTQq6Poqp/DXJ4tjOrOubO
         sN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745303302; x=1745908102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CR3emN5pt/2Xy36pQPHQVyv8ABB4y5f35y7rXhRz1Tk=;
        b=gyV8tL4QUVVZyeeJn6Xg/oOGF9lttLneUJXdrfFZENHgRZG1LdLJ2RUFGMlsSQCnvl
         kWK1mlCLOWU87EAgGh0/4gS1oF5oIyaA3++8sIZMEP4fAUG3r6VYTzhJDdepCFQws2wf
         HSMkXIDA67ks9J/+JSqjrXc7+Kq1+a/aIWg6EsJ2Go74v8ydnUdQtPg+uU6+JJCgN9FC
         9BL5Vxj62EWpIrTJqYJKqo+Nws80+eYi3mXxQWX2FmsMILexiouqnF/2t0EDzG8I+X3s
         zwUTTFbjAUcDRdj3iVPAwotwwxhyVCupLvk98T1In73E29gV8VRr2ubRYTHACVVFXsG5
         MsGg==
X-Forwarded-Encrypted: i=1; AJvYcCXaSWGYubhfmovzxHFcDFSlWrKI/5J86fjm/OK8W/JaXfi81VKZLRVXN/p8NTw/47rs2C8TD+umbj34mv1c@lists.linux.dev
X-Gm-Message-State: AOJu0YwPjAPB85T4x9Dbgu/rCSyBNmIzePZtTvTqcr0jswecWEG9xcwx
	QsrPVAUQK5SQRQfnS/Cbl2JCeYQLUocGVy5vj8QV5ai+LQ80LioFilTevuKewbU=
X-Gm-Gg: ASbGnctXlDrsiJ99OgS1I0nxZ77bPmDRZCJruan8PVSMFSRV8/0w5mFAxR3yfTtZqJd
	CzGE5zDsq5ksUJk2WhXB4miEGhxaZcw2uN/DYDjgRB/bJldxGxqmncpqX9R4EZ5J1vUbk4vQzHW
	xpKvzZpcqfHzW7zOthyCdgMOOPwd5sc5kpO9j8eqZ3uXtnGz7YvgU+b2PIPUHoTlVgnRqFNrgMz
	XikqlwYLtOYhPSLipOMjPHHR8UbfBTHAVQ1rS84HHSl66gxbn9U+lmUsvb894sV+4MJrq06KIWy
	DOUqC9q4p6JylfsSVEbcZUDUfrk8f/xN0tXIUky49QaAFY0y1CBlf3qE
X-Google-Smtp-Source: AGHT+IG4nAFhnN9/3gxIQTDYPw08Z9MNmw0ZmLCbyBZLc5Z+rprF+I8e39GTZC9U6qsvOzJfbzEh6g==
X-Received: by 2002:a05:6000:18a8:b0:391:1218:d5f7 with SMTP id ffacd0b85a97d-39efbad7d6amr10645232f8f.40.1745303301860;
        Mon, 21 Apr 2025 23:28:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa4207d0sm14265173f8f.11.2025.04.21.23.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 23:28:21 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:28:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, marcello.carla@gmx.com
Subject: Re: [PATCH] staging: gpib: Fix lpvo request_system_control
Message-ID: <60a977f5-5781-48ce-86fb-ea6c4fa767b8@stanley.mountain>
References: <20250419105254.28359-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419105254.28359-1-dpenkler@gmail.com>

On Sat, Apr 19, 2025 at 12:52:54PM +0200, Dave Penkler wrote:
> The board should not set the controller-in-charge status in
> request_system_control. It can only become controller-in-charge
> by issuing an interface_clear.
> 
> Remove the setting of controller-in-charge from request_system_control.
> 

The commit message needs to say what this bug looks like to the user.

regards,
dan carpetner

