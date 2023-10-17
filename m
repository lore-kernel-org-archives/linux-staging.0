Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6EC1FD5
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 04:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AKRIKQ9o"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-323168869daso4921258f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Oct 2023 21:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697515566; x=1698120366; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MRNV9tUzQ0HGiFop7vZJJZrVqaqb06rzYLzB4ERo+tI=;
        b=AKRIKQ9o5UG+ugVcnMFlLxUwZg6FgBGOYSJWxst8T/+URmmfL27nHKPh+gAp9pvKXg
         E/p7Mabv7380JpEsMa5PNT0aIzF/JRIpTn6HPKw7/rjzZ0glTKpytRjJ54aMIlfAbWP7
         hCgM9Y0xEy8r9DLv//D0d1nwa88splANOxhEgLGcbp6sAZA2e55htq7PkfjcsRYxO/Q+
         8kf80nUsmkvR3qTisCBftnrFHGYxn3/DfVbKcTa9J0ea5+TmgVQ77Y65l2b+VLDoGUDp
         4Y5+KWyktpC1T20HPgr2jAC7obir4zCHOMFBo8uzQ5nOZEptI7w1G6zX/eW2nKAktrmu
         3Rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697515566; x=1698120366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRNV9tUzQ0HGiFop7vZJJZrVqaqb06rzYLzB4ERo+tI=;
        b=LfosatzlFBQ8HiJ6Aj0fw5sVRgouXmoT/IAGQDrbF4bioH/BkxXa3qH7czcVqGD9Ta
         Od3R/I68FbVSi5h+p0gdavGXW5HN8j/03QiPIkspLM28RzxE8jjBAwPApYPdv8VeKUza
         VECvBLpmMqOQl2KCeXRL+LwbYOxbsCK9JxEGli/7WDyk6qIsX85yUXP8uCA8R+Y2LUGY
         3iwJOLyV1tZdQ5TEbgz7p8X8g/gWt/qBgjF/zvO/EzkkiWxFN/Kj87BXeXYa62sut0yf
         QYMkyCeyujKb4sAAgY8HotCxquGndlQeFlY5K3acHU+N/OIg1X67zKyh3rOc0AtI0hc2
         1FwQ==
X-Gm-Message-State: AOJu0YzhPeNmB3NYYuilc7zRgaB+RTV+TvmqjdReiZc42AVAcfySX5gq
	1N3CbK+gTm5QJc/8jjS/lfn/BA==
X-Google-Smtp-Source: AGHT+IEN+tXVbYc7cnEt64cF8i0CMSVyQvciua7ZKHOFgq241fD+U9PdkOH8UFnAr9bcdaxoxzzF+A==
X-Received: by 2002:adf:db0e:0:b0:32d:9b30:9a76 with SMTP id s14-20020adfdb0e000000b0032d9b309a76mr876829wri.47.1697515566203;
        Mon, 16 Oct 2023 21:06:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m19-20020a056000175300b0032da319a27asm692255wrf.9.2023.10.16.21.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 21:06:05 -0700 (PDT)
Date: Tue, 17 Oct 2023 07:06:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Replace the occurrences of (1<<x) by
 BIT(x)
Message-ID: <a45368a0-6f7c-4401-804d-1ff3cb8803b7@kadam.mountain>
References: <20231016201154.GA14625@ubuntu>
 <433b9d45-bb21-49eb-8062-c03bcffa90ff@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <433b9d45-bb21-49eb-8062-c03bcffa90ff@kadam.mountain>

Btw, eventually if we fix enough checkpatch warnings, then eventually we
get to a point where all the remaining warnings are wrong.  Like we've
fixed everything checkpatch gets correct and only wrong things are left.
So just be aware of that, that sometimes everything checkpatch suggests
is wrong.

regards,
dan carpenter

