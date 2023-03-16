Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D9FA938;
	Thu, 16 Mar 2023 19:30:10 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id r18so2552569wrx.1;
        Thu, 16 Mar 2023 12:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678995008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VydsjTJ9T9aaIh3DZdKvuhPAxII7Qj0WqelnQVYjYXU=;
        b=JKoA/uoO2IyU91+Xv0FftKXwYt9sIYXZuKNgjtNM8X3/6TdOcMg/R9wzs/770LhQSi
         ncnhNEZz4m8Ab9ubM0QJEg4ghTDAt3m+dJgW7VBOcUk6Lre7UjQ7R6KoQj8/twWq8foW
         cG0RnZ7M8TUbmwedM7BuLbNwrp4JA0EqYZ9MJXWNDcHzy5V+Sz1M0F16WTLXct5I2cem
         D/FY/poeNF3UpKIkxZlk4uf8uTimZaKsHZu2WR5FYgKDS+3MSh8pfWV+a8N7vx0c6kSt
         F4FYf5IRw7lR24eYrSPSE3Z5EFOrnzjUpyVk7XzzaOfQN5tHoEb/s0wD7/EKQrCtG0UM
         PJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678995008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VydsjTJ9T9aaIh3DZdKvuhPAxII7Qj0WqelnQVYjYXU=;
        b=7rKte+ogfT6Yyh4p8M3kDVsaH0+pW8KRPeINarrn+bFmHVVtqHtyDxikWw4nXm3y5J
         RTM8BrCqe69TAUYNncZsZg/YkxsDN7CXJ9MuzMqszPGwGI30IUQu3Nc9uvFGBv3ysQNY
         koKFydobS68PsxFSNvzQC0YiS+klrXbb5/hktpOw34rvLYq3AMHG9PNu4F1MGzE2dbv5
         BIyiZeQ/GcyW92/Gkrnz3+2gdlf8XM1U8sTEwmbmkOdxbBByVwz6yJAXbQEgMOg6Nfhh
         nViK9FUKD7OMHSB87diLavjQ/iB1pNwwHxqfVr+LNJsndhtSPr6hrit6cbFLiP9agblZ
         Qj+w==
X-Gm-Message-State: AO0yUKUaJqxCgY2/b21/JOQKYzeSNIQ4P8X70suKkw8N9+bdj2mpZ+cA
	0aGkMMaIWHu/3/8KZWei9HF11L6VtDQ=
X-Google-Smtp-Source: AK7set+1N50ew+2VKa1EtpjE3f3NtQWYZjLVttL2dXLFFYFNoNqxf5a2u8JelKO7SRgTXQuDv1bPsA==
X-Received: by 2002:a5d:63d0:0:b0:2d3:147:c2c4 with SMTP id c16-20020a5d63d0000000b002d30147c2c4mr604294wrw.17.1678995008253;
        Thu, 16 Mar 2023 12:30:08 -0700 (PDT)
Received: from suse.localnet (host-79-35-102-94.retail.telecomitalia.it. [79.35.102.94])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c234100b003e00c453447sm5720690wmq.48.2023.03.16.12.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 12:30:07 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy@lists.linux.dev, Khadija Kamran <kamrankhadijadj@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] staging: axis-fifo: initialize timeouts in init only
Date: Thu, 16 Mar 2023 20:30:06 +0100
Message-ID: <111937545.nniJfEyVGO@suse>
In-Reply-To: <2552330.Lt9SDvczpP@suse>
References:
 <ZBNDJwFHE3vIFS3+@khadija-virtual-machine> <2552330.Lt9SDvczpP@suse>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On gioved=EC 16 marzo 2023 19:11:09 CET Fabio M. De Francesco wrote:
> On gioved=EC 16 marzo 2023 17:26:15 CET Khadija Kamran wrote:
> > Initialize the module parameters, read_timeout and write_timeout once in
> > init().
> >=20
> > Module parameters can only be set once and cannot be modified later, so=
 we
> > don't need to evaluate them again when passing the parameters to
> > wait_event_interruptible_timeout().
> >=20
> > Convert datatype of {read,write}_timeout from 'int' to 'long int' becau=
se
> > implicit conversion of 'long int' to 'int' in statement
> > '{read,write}_timeout =3D MAX_SCHEDULE_TIMEOUT' results in an overflow.
> >=20
> > Change format specifier for {read,write}_timeout from %i to %li.
>=20
> It's good that you added this line. I had missed it :-)
>=20
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> >=20
> > Changes in v6:
> >  - Initialize module parameters in init instead of probe function.
> >  - Change the subject and description
> >  - Change format specifiers of module parameters to "%li"
> >=20
> > Changes in v5:
> >  - Convert module parameters's datatype from int to long.
>=20
> NIT: "parameters'", not "parameters's".
>=20
> >  - Link to patch:
> >  https://lore.kernel.org/outreachy/ZBMR4s8xyHGqMm72@khadija-virtual-mac=
hine/
> >=20
> > Changes in v4:
> >  - Initialize timeouts once as suggested by Greg; this automatically
> > =20
> >    fixes the indentation problems.
> > =20
> >  - Change the subject and description.
> >  - Link to patch:
> >  https://lore.kernel.org/outreachy/ZA4M3+ZeB1Rl2fbs@khadija-virtual-mac=
hine/
> >=20
> > Changes in v3:
> >  - Correct grammatical mistakes
> >  - Do not change the second argument's indentation in split lines
> >=20
> > Changes in v2:
> >  - Instead of matching alignment to open parenthesis, align second and
> > =20
> >    the last argument.
> > =20
> >  - Change the subject and use imperative language.
> >  - Link to patch:
> >  https://lore.kernel.org/outreachy/ZAxNYw2rFQkrdtKl@khadija-virtual-mac=
hine/
> >=20
> > Link to first patch:
> >  https://lore.kernel.org/outreachy/ZAZSmPpB6fcozGa4@khadija-virtual-mac=
hine/
> >=20
> > drivers/staging/axis-fifo/axis-fifo.c | 28 ++++++++++++++++-----------
> >=20
> >  1 file changed, 17 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/staging/axis-fifo/axis-fifo.c
> > b/drivers/staging/axis-fifo/axis-fifo.c index dfd2b357f484..0a85ea667a1b
> > 100644
> > --- a/drivers/staging/axis-fifo/axis-fifo.c
> > +++ b/drivers/staging/axis-fifo/axis-fifo.c
> > @@ -103,17 +103,17 @@
> >=20
> >   *           globals
> >   * ----------------------------
> >   */
> >=20
> > -static int read_timeout =3D 1000; /* ms to wait before read() times ou=
t */
> > -static int write_timeout =3D 1000; /* ms to wait before write() times =
out=20
*/
> > +static long read_timeout =3D 1000; /* ms to wait before read() times o=
ut */
> > +static long write_timeout =3D 1000; /* ms to wait before write() times=
 out=20
*/
> >=20
> >  /* ----------------------------
> > =20
> >   * module command-line arguments
> >   * ----------------------------
> >   */
> >=20
> > -module_param(read_timeout, int, 0444);
> > +module_param(read_timeout, long, 0444);
> >=20
> >  MODULE_PARM_DESC(read_timeout, "ms to wait before blocking read() timi=
ng
>=20
> out;
>=20
> > set to -1 for no timeout"); -module_param(write_timeout, int, 0444);
> > +module_param(write_timeout, long, 0444);
> >=20
> >  MODULE_PARM_DESC(write_timeout, "ms to wait before blocking write()=20
timing
> >=20
> > out; set to -1 for no timeout");
> >=20
> >  /* ----------------------------
> >=20
> > @@ -384,9 +384,7 @@ static ssize_t axis_fifo_read(struct file *f, char
>=20
> __user
>=20
> > *buf, mutex_lock(&fifo->read_lock);
> >=20
> >  		ret =3D wait_event_interruptible_timeout(fifo->read_queue,
> >  	=09
> >  			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
> >=20
> > -				 (read_timeout >=3D 0) ?
> > -				  msecs_to_jiffies(read_timeout) :
> > -				  MAX_SCHEDULE_TIMEOUT);
> > +			read_timeout);
> >=20
> >  		if (ret <=3D 0) {
> >  	=09
> >  			if (ret =3D=3D 0) {
> >=20
> > @@ -528,9 +526,7 @@ static ssize_t axis_fifo_write(struct file *f, const
>=20
> char
>=20
> > __user *buf, ret =3D wait_event_interruptible_timeout(fifo->write_queue,
> >=20
> >  			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
> >  		=09
> >  				 >=3D words_to_write,
>=20
> NIT: I don't really like this split of the second argument into two lines.
> This line may look too long, but I don't think that it should be split. I
> prefer to read
>=20
> "ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >=3D words_to_write,"
>=20
> However, the final decision is up to Greg.
>=20
> If he takes the code as is, I have nothing against.
> Don't send any other version unless required by Greg or other Mentors with
> more experience than I have.
>=20
> All the rest look good... well done!
>=20
> Reviewed-by: Fabio M. De Francesco

Sorry, I got distracted while copy-pasting my own address...

Reviewed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
=20
> Please feel free to forward my tag if you are required to change that lin=
e=20
and
> send a new version.
>=20
> Thanks,
>=20
> Fabio
>=20
> > -				 (write_timeout >=3D 0) ?
> > -				  msecs_to_jiffies(write_timeout) :
> > -				  MAX_SCHEDULE_TIMEOUT);
> > +			write_timeout);
> >=20
> >  		if (ret <=3D 0) {
> >  	=09
> >  			if (ret =3D=3D 0) {
> >=20
> > @@ -948,7 +944,17 @@ static struct platform_driver axis_fifo_driver =3D=
 {
> >=20
> >  static int __init axis_fifo_init(void)
> >  {
> >=20
> > -	pr_info("axis-fifo driver loaded with parameters read_timeout =3D %i,
> > write_timeout =3D %i\n", +	if (read_timeout >=3D 0)
> > +		read_timeout =3D msecs_to_jiffies(read_timeout);
> > +	else
> > +		read_timeout =3D MAX_SCHEDULE_TIMEOUT;
> > +
> > +	if (write_timeout >=3D 0)
> > +		write_timeout =3D msecs_to_jiffies(write_timeout);
> > +	else
> > +		write_timeout =3D MAX_SCHEDULE_TIMEOUT;
> > +
> > +	pr_info("axis-fifo driver loaded with parameters read_timeout =3D %li,
> > write_timeout =3D %li\n", read_timeout, write_timeout);
> >=20
> >  	return platform_driver_register(&axis_fifo_driver);
> > =20
> >  }
> >=20
> > --
> > 2.34.1




