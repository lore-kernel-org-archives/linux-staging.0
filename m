Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B77B3C00;
	Thu, 16 Mar 2023 15:12:25 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id eh3so8906496edb.11;
        Thu, 16 Mar 2023 08:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678979543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=asBS8y7PevjBy9t5aO9VO8B6knuWmZ1TaIJ9l/J32qc=;
        b=AQjEntfQnFhtxpLKwoMDGc8s2Oy6DRL8oBkuWR3Eet8xPxZzvscyr2x/y1IryhAtzt
         yqMm7MyN8ChX0fBkMMjC9RzI3gyffod2sIzIOD70Mphp+wbG0cTeHxagLzJdiqUxYaID
         vFoeoFLDMDsq1aUkXcKTCqltc3i6ZixoNdc1Y6HkldSPaJ0KliGN16jJK4ahUm7MZs3M
         8xBJe4HlfKiH0fXiA5BOVtpH26bRAws1QFstPwM5ZLElGT7dhbtE0druh9DTJGzedWn5
         fkatCrP0EwtND/HUJhEN2qZReN+3K2YvhTNpUctTV9oBJp3qNY7DqpdcygI+M9m+HrwK
         0rcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678979543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asBS8y7PevjBy9t5aO9VO8B6knuWmZ1TaIJ9l/J32qc=;
        b=UiSyGSKvDT0dIGTvuPw20pjKZIEP0XUrLAdKCYV7BodrFsgcgoyotH0ykHbT6gbZfB
         qbYrz1IMqiGTTev2W9kJ8owigraNjPc1HM3sHZCgvw757fjhPKyfaUS3mzR7fUQujd/2
         5fWIGYJ+ISJawuQoer0OEEyIJ31Yhfl/qmuJHHreQ0GUgMmC1jn3OtQF6ecLV/BMIuC2
         a5uVq7cpvocXpiuG2JWKBcWNQ+TbnfiBOeKIWmpIh2/gwERE9kgd8H2glxK6TCUyxfKL
         0sv7U+izL6lnF2xKLlxCP+c6XkYDU/G99s0XhJO2y7KNKCFjr2n6cAy+UKGAwGLbZ+8z
         Nfww==
X-Gm-Message-State: AO0yUKWFUoRDIhOc/rRn6gmrjwkM5cL85f4HRYgg1v0UK6ptXen9pW2X
	VcDXUQD/Br8YiNKqxCW5m7I=
X-Google-Smtp-Source: AK7set9fsXThPkKIzSoBKhntPnCzx4qNSRa0kk8lDHshW4nYZusnuVd1kPTdtJmHp7HXyESIoyEw9Q==
X-Received: by 2002:a05:6402:12c3:b0:4fd:1fe1:838f with SMTP id k3-20020a05640212c300b004fd1fe1838fmr7895169edx.14.1678979543241;
        Thu, 16 Mar 2023 08:12:23 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.209.88])
        by smtp.gmail.com with ESMTPSA id s23-20020a50ab17000000b004f1e91c9f87sm4014573edc.3.2023.03.16.08.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 08:12:22 -0700 (PDT)
Date: Thu, 16 Mar 2023 20:12:20 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: axis-fifo: initialize timeouts in probe only
Message-ID: <ZBMx1O/4Z/4p46wM@khadija-virtual-machine>
References: <ZBMR4s8xyHGqMm72@khadija-virtual-machine>
 <ZBMT41g8kYQPCw+d@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBMT41g8kYQPCw+d@kroah.com>

Hey Greg,
Thank you for the feedback, I am working on it.
I have some compilation problems currently. I'll make sure to fix them
before sending the next patch.

Regards,
Khadija

