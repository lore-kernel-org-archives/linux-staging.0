Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC8E2F34;
	Fri, 17 Mar 2023 10:29:29 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id r18so3971578wrx.1;
        Fri, 17 Mar 2023 03:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679048967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuZUyofIuGVDenmcj5ExrniO6JD0P9UJ0EOD/LAKZG4=;
        b=TG1j+Nj8p52X9YGYTzaJ0HuU/7K75RmHUXQsd9RU0Wrcgii5vqRr5nyZb/vqjRkzuF
         +QbgFXRoJOBTXpU0aQZ8pyIMiIAlxbmq9effU0btRZBbgge1h/9OMuLRTc4kEQycWP7a
         4wc/vyeTBZ9kuYriBE2mX03aX+mAnTXPUUp3IpOyFRNteisvqxtSyhVW3yhdJyU8bp2Y
         Q4JtHYF/i86/fMNkadeChqcziwf8hlqSar2PErH0Q0Pvi3KSwbE3xXoB8D4B/kRFgGUs
         9KHJcka/12wVW+ZhgPOE7KWQABS7jhZb4opyOwQshbPHj6svxmjU+uGia9Y+LhQuRsVw
         gljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679048967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MuZUyofIuGVDenmcj5ExrniO6JD0P9UJ0EOD/LAKZG4=;
        b=R2XRAox/vIYwmFaiwg7MiRxv+65TMFbK0k1w/Z695xG27MbZkWkuKkoC3YgacR8EL9
         /NWN6SGPauliwkiP9DIsNHS+lY8lPRd5PQpX+YahVyyU3u/SarwiyyXrMOna5xb5e0s+
         /IC2SOXE092c9OZcRSmkYWSV4k93IBE+IFbXqcOgSBghV0Slv8rBf+38xWdi+2FkYFoH
         gsb/u6xO97p7oZBbOTKSxuJWJx3dhd5sV4q/Xo85ZopcHcwpgXqdhy7GRqwErXJWjRL4
         7ZRnTXSG1i91MnEf6wgpDhuJZX5447uC804ISDjY8ochXUdwtdX7NbxTFQSmUnBv3Lh1
         Y8FA==
X-Gm-Message-State: AO0yUKUPQnpiCzF+mXdiOSAxsTYmJMJg4FDwY/+pFZaLgSDy8K3q3KMR
	jU5A6fjrbcJcBsjcV8RaOxmJOzcnL0k=
X-Google-Smtp-Source: AK7set9ZV6772oqyRYTHg5hoPpkPMbUEHmYoiY9QFqzq98Ag+9KaCZ2OO0yx+aPdT6UumGv38vfcWQ==
X-Received: by 2002:adf:e78d:0:b0:2c9:640f:635b with SMTP id n13-20020adfe78d000000b002c9640f635bmr6278162wrm.56.1679048966952;
        Fri, 17 Mar 2023 03:29:26 -0700 (PDT)
Received: from suse.localnet (host-79-35-102-94.retail.telecomitalia.it. [79.35.102.94])
        by smtp.gmail.com with ESMTPSA id f11-20020a5d4dcb000000b002cfe3f842c8sm1602940wru.56.2023.03.17.03.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 03:29:26 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy@lists.linux.dev, Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] staging: axis-fifo: initialize timeouts in init only
Date: Fri, 17 Mar 2023 11:29:25 +0100
Message-ID: <2222576.3ZeAukHxDK@suse>
In-Reply-To: <ZBN3XAsItCiTk7CV@khadija-virtual-machine>
References: <ZBN3XAsItCiTk7CV@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Khadija,

Congratulations for having your first patch in Linux, via Greg's staging tr=
ee.

It will take some time before it reaches mainline, although it is already o=
n=20
its way to get upstream.

On gioved=EC 16 marzo 2023 21:09:00 CET Khadija Kamran wrote:
> Initialize the module parameters, read_timeout and write_timeout once in
> init().
>=20
> Module parameters can only be set once and cannot be modified later, so we
> don't need to evaluate them again when passing the parameters to
> wait_event_interruptible_timeout().

Greg made you (and indirectly me notice) that the statement above is a kind=
 of=20
short-circuit because it misses to make the readers notice that you are=20
dealing with specific permissions granted to these two module's parameters.

Please take a look at the permissions associated with those parameters:

module_param(write_timeout, long, 0444);
module_param(read_timeout, long, 0444);

Can you understand what '0444' stands for? What if their permissions were =
=20
instead something like '0666' or '0664'?

(I'm not asking you to answer these questions, instead I am only asking you=
 to=20
learn how it works if you don't know it yet).

=46abio

> Convert datatype of {read,write}_timeout from 'int' to 'long int' because
> implicit conversion of 'long int' to 'int' in statement
> '{read,write}_timeout =3D MAX_SCHEDULE_TIMEOUT' results in an overflow.
>=20
> Change format specifier for {read,write}_timeout from %i to %li.
>=20
> Reviewed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>=20
> Changes in v8:
>  - Fixed a spelling mistake
>=20
> Changes in v7:
>  - Fixed a grammatical error
>=20
> Changes in v6:
>  - Initialize module parameters in init instead of probe function.
>  - Change the subject and description
>  - Change format specifiers of module parameters to "%li"
>=20
> Changes in v5:
>  - Convert module parameters datatype from int to long.
>  - Link to patch:
>  https://lore.kernel.org/outreachy/ZBMR4s8xyHGqMm72@khadija-virtual-machi=
ne/
>=20
> Changes in v4:
>  - Initialize timeouts once as suggested by Greg; this automatically
>    fixes the indentation problems.
>  - Change the subject and description.
>  - Link to patch:
>  https://lore.kernel.org/outreachy/ZA4M3+ZeB1Rl2fbs@khadija-virtual-machi=
ne/
>=20
> Changes in v3:
>  - Correct grammatical mistakes
>  - Do not change the second argument's indentation in split lines
>=20
> Changes in v2:
>  - Instead of matching alignment to open parenthesis, align second and
>    the last argument.
>  - Change the subject and use imperative language.
>  - Link to patch:
>  https://lore.kernel.org/outreachy/ZAxNYw2rFQkrdtKl@khadija-virtual-machi=
ne/
>=20
> Link to first patch:
>  https://lore.kernel.org/outreachy/ZAZSmPpB6fcozGa4@khadija-virtual-machi=
ne/
>=20
>  drivers/staging/axis-fifo/axis-fifo.c | 28 ++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c
> b/drivers/staging/axis-fifo/axis-fifo.c index dfd2b357f484..0a85ea667a1b
> 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -103,17 +103,17 @@
>   *           globals
>   * ----------------------------
>   */
> -static int read_timeout =3D 1000; /* ms to wait before read() times out =
*/
> -static int write_timeout =3D 1000; /* ms to wait before write() times ou=
t */
> +static long read_timeout =3D 1000; /* ms to wait before read() times out=
 */
> +static long write_timeout =3D 1000; /* ms to wait before write() times o=
ut */
>=20
>  /* ----------------------------
>   * module command-line arguments
>   * ----------------------------
>   */
>=20
> -module_param(read_timeout, int, 0444);
> +module_param(read_timeout, long, 0444);
>  MODULE_PARM_DESC(read_timeout, "ms to wait before blocking read() timing=
=20
out;
> set to -1 for no timeout"); -module_param(write_timeout, int, 0444);
> +module_param(write_timeout, long, 0444);
>  MODULE_PARM_DESC(write_timeout, "ms to wait before blocking write() timi=
ng
> out; set to -1 for no timeout");
>=20
>  /* ----------------------------
> @@ -384,9 +384,7 @@ static ssize_t axis_fifo_read(struct file *f, char=20
__user
> *buf, mutex_lock(&fifo->read_lock);
>  		ret =3D wait_event_interruptible_timeout(fifo->read_queue,
>  			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
> -				 (read_timeout >=3D 0) ?
> -				  msecs_to_jiffies(read_timeout) :
> -				  MAX_SCHEDULE_TIMEOUT);
> +			read_timeout);
>=20
>  		if (ret <=3D 0) {
>  			if (ret =3D=3D 0) {
> @@ -528,9 +526,7 @@ static ssize_t axis_fifo_write(struct file *f, const=
=20
char
> __user *buf, ret =3D wait_event_interruptible_timeout(fifo->write_queue,
>  			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
>=20
>  				 >=3D words_to_write,
>=20
> -				 (write_timeout >=3D 0) ?
> -				  msecs_to_jiffies(write_timeout) :
> -				  MAX_SCHEDULE_TIMEOUT);
> +			write_timeout);
>=20
>  		if (ret <=3D 0) {
>  			if (ret =3D=3D 0) {
> @@ -948,7 +944,17 @@ static struct platform_driver axis_fifo_driver =3D {
>=20
>  static int __init axis_fifo_init(void)
>  {
> -	pr_info("axis-fifo driver loaded with parameters read_timeout =3D %i,
> write_timeout =3D %i\n", +	if (read_timeout >=3D 0)
> +		read_timeout =3D msecs_to_jiffies(read_timeout);
> +	else
> +		read_timeout =3D MAX_SCHEDULE_TIMEOUT;
> +
> +	if (write_timeout >=3D 0)
> +		write_timeout =3D msecs_to_jiffies(write_timeout);
> +	else
> +		write_timeout =3D MAX_SCHEDULE_TIMEOUT;
> +
> +	pr_info("axis-fifo driver loaded with parameters read_timeout =3D %li,
> write_timeout =3D %li\n", read_timeout, write_timeout);
>  	return platform_driver_register(&axis_fifo_driver);
>  }
> --
> 2.34.1




